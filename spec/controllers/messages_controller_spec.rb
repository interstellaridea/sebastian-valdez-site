require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

	describe 'GET #new' do
		it 'returns success' do
			get :new
		end
	end
end
