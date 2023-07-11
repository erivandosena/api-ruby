module Api
  module V1
    class WelcomeController < ApplicationController
      def index
        render json: { message: "Welcome to API RESTful Ruby on Rails" }
      end
    end
  end
end
