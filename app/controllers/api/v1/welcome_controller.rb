class Api::V1::WelcomeController < ApplicationController
  def index
    render json: { message: I18n.t('welcome.message') }
  end
end