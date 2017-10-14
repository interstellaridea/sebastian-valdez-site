class Message
	include ActiveModel::Model # brings in initialize method
	attr_accessor :name, :subject, :sender_email, :body
	validates :name, presence: true
	validates :subject, presence: true
	validates :sender_email, presence: true
	validates_email :sender_email
	validates :body, presence: true

end