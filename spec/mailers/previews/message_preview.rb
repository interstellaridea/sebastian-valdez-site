# Preview all emails at http://localhost:3000/rails/mailers/message
class MessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message/contact_me
  def contact_me
  	msg = Message.new name: 'Jim the recuiter',
  										email: 'newCompany@company.com',
  										body: 'Hey want a job?'
    MessageMailer.contact_me msg
  end

end
