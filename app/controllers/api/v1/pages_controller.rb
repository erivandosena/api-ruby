# class PagesController < ApplicationController
class Api::V1::PagesController < ApplicationController
  before_action :set_page, only: %i[ show update destroy ]

  # GET /pages
  def index
    @pages = Page.all

    render json: @pages
  end

  # GET /pages/1
  def show
    render json: @page
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by(id: params[:id])

      unless @page
        render json: { error: I18n.t('errors.resource_not_found') }, status: :not_found
      end
    end
    
    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :description, :active)
    end
end
