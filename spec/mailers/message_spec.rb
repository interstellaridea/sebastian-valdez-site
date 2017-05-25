require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  describe "contact_me" do
    # creates message 
    msg = Message.new name: 'Joe',
                      email: 'from@example.com',
                      body: 'Hey this is a test'
    # pass message to Mailer class method
    let(:mail) { MessageMailer.contact_me msg }

    it "renders the headers" do
      expect(mail.subject).to eq("Message from sebastian-valdez.com")
      expect(mail.to).to eq(["valdez.sebastian4@gmail.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match('Hey this is a test')
    end
  end

end
