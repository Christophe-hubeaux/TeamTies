class MatchesController < ApplicationController
    def index
        @matchs = Match.all
    end
end
