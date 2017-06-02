Rails.application.routes.draw do
  root 'welcome#home'
  get  'contact-me',			to: 'messages#new',			as: 'new_message'
  get  'resume-download',	to: 'welcome#download_resume',		as: 'download_resume'
  post 'contact-me',			to: 'messages#create',	as: 'create_message'
end
