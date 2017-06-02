class WelcomeController < ApplicationController
  def home
  	@message = Message.new
  end

  def contact
  end

	def download_resume
		send_file(
			"#{Rails.root}/public/resume.pdf",
			filename: "SebastianValdez_Resume.pdf",
			type: "application/pdf"
		)
	end
end
