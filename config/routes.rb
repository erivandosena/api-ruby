Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get '/', to: 'welcome#index'
      # Outras rotas da API
    end
  end
  
  # Rota raiz para a página padrão do Rails
  root to: "rails/welcome#index" 
end
