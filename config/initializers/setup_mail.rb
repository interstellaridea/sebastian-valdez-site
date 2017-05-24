ActionMailer::Base.default_options = {from: 'no-reply@sebastian-valdez.com'}
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV["GMAIL_USER"],
  password: ENV["GMAIL_PASS"],
  authentication: :plain,
  enable_starttls_auto: true
}