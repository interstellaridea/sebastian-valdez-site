class Message
	include ActiveModel::Model # brings in initialize method
	attr_accessor :name, :email, :body
	validates :name, :email, :body, presence: true
end
