class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render status: 404, template: 'errors/not_found' }
    end
    # render json: { error: 'Página não encontrada' }, status: :not_found
  end
end
