Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :home
  root "home#index"
  resources :documents do
    member do
      get 'download'
    end
    resources :document_suggestions, only: [:new, :create]
  end

  resource :accounts, only: [:edit, :update]

  get 'documents/preview/:slug', to: 'document_previews#show', as: :document_preview
  get 'student/documents', to: 'document_previews#index', as: :student_documents


  namespace :admin do
    resources :dashboard, only: %i[index]
    resources :users, except: [:show, :new, :create]
    resources :documents
  end

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
