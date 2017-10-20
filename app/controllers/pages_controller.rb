class PagesController < ApplicationController
  def home
    @message = Message.new
    @current_resume = Resume.last
  end

  def about_me
  end

  def contact
    @message = Message.new(message_params)
    if @message.valid?
      ContactMeMailer.send_contact(@message).deliver_now
    else
      render nothing: true, status: :service_unavailable
    end
  end

  def download_resume
    @current_resume = Resume.last
    send_file(
      @current_resume.location.path,
      filename: "SebastianValdez_Resume.pdf",
      type: 'application/pdf',
      disposition: 'attachment',
      url_based_filename: true
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
