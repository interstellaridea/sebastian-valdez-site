class WelcomeController < ApplicationController
  def home
  	@message = Message.new
  end
  def contact
  end
end
