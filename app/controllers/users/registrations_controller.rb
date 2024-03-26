# frozen_string_literal: true

require 'fastimage'
require 'cloudinary'

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  def create
    build_resource(sign_up_params)

    resource.avatar = params[:user][:avatar]
    validate_image_size

    return unless resource.errors.empty?

    upload_avatar
    save_resource
  end

  private

  def validate_image_size
    image_path = resource.avatar.tempfile.path
    size = FastImage.size(image_path)
    return unless size[0] > 200 || size[1] > 200

    resource.errors.add(:avatar, "doit être inférieure à 200x200 pixels")
  end

  def upload_avatar
    resource.avatar = Cloudinary::Uploader.upload(resource.avatar.tempfile.path)['secure_url']
  end

  def save_resource
    resource.save
    yield_resource_if_block_given
    handle_resource_persistence
  end

  def yield_resource_if_block_given
    yield resource if block_given?
  end

  def handle_resource_persistence
    if resource.persisted?
      handle_resource_authentication
    else
      handle_resource_failure
    end
  end

  def handle_resource_authentication
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

  def handle_resource_failure
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
