Rails.application.routes.draw do

	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, skip: [:registrations]
	namespace :admin do
			resources :portals, except: [:new], controller: 'portal'
				get 'add-traits', to: 'portal#new'
				get 'toggle_status/:id', to: 'portal#toggle_status', as: 'toggle_status'

	end

	resources :blogs do
		member do 
			get 'toggle_status/:state', to: 'blogs#toggle_status', as: 'toggle_status'
		end
	end

  get  'download_resume', to: 'pages#download_resume'
  get 	'about-me',	to: 'pages#about_me'
  post 'contact_me', to: 'pages#contact'
  root 'pages#home'

end
