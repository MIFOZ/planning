Rails.application.routes.draw do
  get 'workflows/index'

  get 'workflows/new'

  get 'workflows/edit'

  get 'projects/index'

  get 'projects/new'

  get 'projects/edit'

  get 'structure_units/index'

  get 'structure_units/edit'

  get 'structure_units/show'

  get 'human_beans/index'
  get 'human_beans/new'
  get 'human_beans/edit'
  get 'human_beans/create'
  get 'human_beans/update'


  resources :plans do
    member do
      patch 'update_task'
    end
    resources :tasks do
      member do
        patch 'finish_editing'
      end
    end
  end

  resources :human_beans
  resources :posts
  resources :structure_units
  resources :projects
  resources :workflows
  resources :current_tasks

  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'sign_up' => 'users#new', :as => 'sign_up'

  root 'users#new'

  resources :users
  resources :sessions

  post '/application/catalogue' => 'application#catalogue'
  
end
