class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  def contact_me(msg)
    @body = msg.body
    mail to: "valdez.sebastian4@gmail.com", from: msg.email
  end
end
