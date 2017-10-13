class PagesController < ApplicationController
  def home
    @message = Message.new
  end

  def about_me
  end

  def contact
    @message = Message.new(message_params)
    if @message
      ContactMeMailer.send_contact(@message).deliver_now
    else
      flash[:error] = "Your message was not delivered!"
      redirect_to root_path
    end      
  end

  def download_resume
    send_file(
    "#{Rails.root}/public/resume.pdf",
    filename: "SebastianValdez_Resume.pdf",
    type: "application/pdf"
    )
  end
  private
  def message_params
    params.require(:message).permit(
                            :name,
                            :subject,
                            :sender_email,
                            :body )
  end
end
