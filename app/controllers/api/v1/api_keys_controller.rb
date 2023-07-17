class Api::V1::ApiKeysController < ApplicationController
    include ApiKeyAuthenticatable

    # Requer autenticação de chave de API
    prepend_before_action :authenticate_with_api_key!, only: %i[index destroy]

    # Autenticação de chave de API opcional para logout
    prepend_before_action :authenticate_with_api_key, only: [:destroy]

    def index
        render json: current_bearer.api_keys
    end

    def create
        # authenticate_with_http_basic do |email, password|
        #     @user = User.find_by email: email

        #     if @user&.authenticate(password)
        #         api_key = @user.api_keys.create! token: SecureRandom.hex

        #         render json: api_key, status: :created and return
        #     end
        # end

        # render status: :unauthorized


        authenticate_with_http_basic do |email, password|
            @user = User.find_by(email: email)

            if @user&.authenticate(password)
            api_key = @user.api_keys.create!(token: SecureRandom.hex)

            render json: { api_key: api_key.token }, status: :created and return
            end
        end

        render json: { error: 'Unauthorized' }, status: :unauthorized

    end

    def destroy
        api_key = current_bearer.api_keys.find(params[:id])

        api_key.destroy
    end
end