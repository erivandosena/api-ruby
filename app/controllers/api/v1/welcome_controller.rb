module Api
  module V1
    class WelcomeController < ApplicationController
      def index
        render json: { message: I18n.t('welcome.message') }
      end
    end
  end
end
