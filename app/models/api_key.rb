class ApiKey < ApplicationRecord
    HMAC_SECRET_KEY = ENV.fetch('API_KEY_HMAC_SECRET_KEY')

    # Atributo virtual para value de token bruto, permitindo responder com o
    # value do token sem hash da chave de API, mas apenas imediatamente após a criação.
    attr_accessor :token

    belongs_to :bearer, polymorphic: true

    before_create :generate_token_hmac

    def self.authenticate_by_token!(token)
        digest = OpenSSL::HMAC.hexdigest 'SHA256', HMAC_SECRET_KEY, token
        find_by! token_digest: digest
    end

    def self.authenticate_by_token(token)
        authenticate_by_token! token
        rescue ActiveRecord::RecordNotFound
        nil
    end

    # Adiciona o atributo de token virtual aos atributos serializáveis e exclui
    # digest HMAC do token
    def serializable_hash(options = nil)
        h = super options.merge(except: 'token_digest')
        h.merge! 'token' => token if token.present?
        h
    end

    private

    def generate_token_hmac
        raise ActiveRecord::RecordInvalid, 'token is required' unless token.present?

        digest = OpenSSL::HMAC.hexdigest 'SHA256', HMAC_SECRET_KEY, token

        self.token_digest = digest
    end
end