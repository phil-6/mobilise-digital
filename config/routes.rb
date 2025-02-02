Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#main'

  devise_for :users,  path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
             controllers: {
                 registrations: 'users/registrations',
                 sessions: 'users/sessions',
                 confirmations: 'users/confirmations'
             }
  devise_scope :user do
    get '/confirmation/pending',  to: 'users/confirmations#pending'
  end

  get '/dashboard',               to: 'pages#dashboard'

  get '/applications',            to: 'job_applications#index'
  get '/admin/applications',      to: 'admin/job_applications#index'

  namespace :admin do
    resources :users
    resources :referrals
    resources :jobs do
      resources :job_applications , :path => 'applications'
    end
    resources :job_applications , :path => 'applications'
  end

  resources :jobs do
    resources :job_applications, :path => 'applications'
  end

  resources :referrals, :path => 'referrals'

  get '/:page',                   to: 'pages#show'

  get '/profile/download_self_assessment_form',       to:  'files#download_self_assessment_form'
  get '/community/download_wol_guide/:id', to:  'files#download_wol_guide'


end
