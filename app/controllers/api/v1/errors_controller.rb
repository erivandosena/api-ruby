# app/controllers/errors_controller.rb
class Api::V1::ErrorsController < ApplicationController
  def not_found
    render json: { error: I18n.t('errors.endpoint_not_found') }, status: :not_found
  end
end