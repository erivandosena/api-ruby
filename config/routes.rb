Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do

      # Rota para a documentação do Swagger
      mount Rswag::Api::Engine => '/api-docs'
      mount Rswag::Ui::Engine => '/api-docs'

      resources :pages
      
      get '/', to: 'welcome#index'
      # Outras rotas da API

     # Rota para capturar todas as rotas não correspondentes e retornar o erro 404
      match '*unmatched_route', to: 'errors#not_found', via: :all
    end
  end

  get '*unmatched_route', to: 'errors#not_found'

  # Rota raiz para a página padrão do Rails
  root to: "rails/welcome#index" 

  # Rota para capturar todas as outras rotas não correspondentes e retornar o erro 404
  match "*path", to: "errors#not_found", via: :all
end
