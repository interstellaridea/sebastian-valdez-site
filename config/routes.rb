Rails.application.routes.draw do

	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, skip: [:registrations]
	namespace :admin do
		get 'portal', to: 'portal#index'
		post 'upload_resume', to: 'portal#upload_resume'
	end
  get  'download_resume', to: 'pages#download_resume'
  get 	'about-me',	to: 'pages#about_me'
  post 'contact_me', to: 'pages#contact'
  root 'pages#home'

end
