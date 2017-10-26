class PagesController < ApplicationController
  def home
    @message = Message.new
    @admin_traits = Trait.admin_posts.first
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

  # def download_resume
  #  cookies['fileDownload'] = 'true'

  #   @current_resume = Resume.last
  #   send_file(
  #     @current_resume.location.path,
  #     filename: "SebastianValdez_Resume.pdf",
  #     type: 'application/pdf',
  #     disposition: 'attachment',
  #     x_sendfile: true
  #   )
  # end
  private
  def message_params
    params.require(:message).permit(
                            :name,
                            :subject,
                            :sender_email,
                            :body )
  end
end
