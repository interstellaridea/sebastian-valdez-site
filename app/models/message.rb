class Message
	include ActiveModel::Model # brings in initialize method
	attr_accessor :name, :subject, :sender_email, :body
	validates :name, :subject, :sender_email, :body, presence: true

end