# frozen_string_literal: true

require 'image_processing/mini_magick'
require 'mini_magick'
require 'cloudinary'
require 'byebug'

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    def create
      build_resource(sign_up_params)
      uploaded_file = params[:user][:avatar]  # Get the uploaded file
      resource.avatar.attach(uploaded_file) if uploaded_file  # Attach the file to the resource

      if resource.save
        resize_and_upload_avatar(uploaded_file)  # Pass the uploaded file to the method
        sign_up_user
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :avatar, :department, :pseudo])
    end

    def resize_and_upload_avatar(uploaded_file)
      if uploaded_file.present?
        image = ImageProcessing::MiniMagick.source(uploaded_file.tempfile.path)
        cropped_image = image.resize_to_fill!(200, 200, gravity: 'Center')

        avatar_url = Cloudinary::Uploader.upload(cropped_image.path)['secure_url']
        resource.avatar.attach(io: cropped_image, filename: uploaded_file.original_filename)

        avatar_url
      else
        # No avatar uploaded, return nil or do any other necessary handling
        nil
      end
    rescue => e
      logger.error "Error resizing or uploading avatar: #{e.message}"
      resource.errors.add(:avatar, "could not be processed")
      nil
    end

    def sign_up_user
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    end

    def after_sign_up_path_for(resource)
      if resource.active_for_authentication?
        code = params[:code] || request.path.split('/').last
        params[:code].present? ? dashboard_game_path(Game.find_by(code: code)) : root_path
      else
        after_inactive_sign_up_path_for(resource)
      end
    end
  end
end
