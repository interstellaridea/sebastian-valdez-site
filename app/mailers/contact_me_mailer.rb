class ContactMeMailer < ApplicationMailer

	def send_contact contact
		mail to: 'valdez.sebastian4@gmail.com',
				subject: contact.subject,
				from: contact.sender_email,
				body: contact.body
	end
end
