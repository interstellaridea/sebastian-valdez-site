ActionMailer::Base.default_options = {from: 'no-reply@sebastian-valdez.com'}
ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: 587,
  domain: 'sebastian-valdez.com',
  authentication: :plain,
  user_name: 'apikey',
  password: ENV["SENDGRID_API_KEY"],
  enable_starttls_auto: true
}