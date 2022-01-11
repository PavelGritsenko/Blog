# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index' # путь на главную страницу

  resource :session, only: %i[new create destroy]
  resources :users

  resources :articles do # путь ко всем методам в контролере create, show, update, destroy
    resources :comments   # методы create, destroy
  end
end
