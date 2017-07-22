Rails.application.routes.draw do
  get  'contact-me',			to: 'messages#new',			as: 'new_message'
  post 'contact-me',			to: 'messages#create',	as: 'create_message'
  get  'resume-download', to: 'welcome#download_resume',    as: 'download_resume'
  root 'pages#home'
end
