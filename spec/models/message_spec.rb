require 'rails_helper'

RSpec.describe Message, type: :model do
  
	describe 'Response' do

		before do
			@msg = Message.new
		end

		it 'can respond to name' do
			expect(@msg).to respond_to(:name)
		end

		it 'can respond to email' do
			expect(@msg).to respond_to(:email)
		end

		it 'can respond to body' do
			expect(@msg).to respond_to(:body)
		end
	end

	describe 'Validitiy' do 
		it 'shoud be valid when attribs are set' do
			attr = {
				name: 'Joe',
				email: 'joe@example.com',
				body: 'Hey, old friend.'
			}
			
			msg = Message.new attr # had to include ActiveModel:Model for init method
			expect(msg).to be_valid
		end

		it 'not be vaild if attributes are blank' do
			msg = Message.new

			expect(msg).to_not be_valid
		end

	end



end
