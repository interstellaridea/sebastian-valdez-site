Rails.application.routes.draw do
  get  'resume-download', to: 'pages#download_resume', as: 'download_resume'
  get 	'about-me',	to: 'pages#about_me'
  post 'contact_me', to: 'pages#contact'
  root 'pages#home'

end
