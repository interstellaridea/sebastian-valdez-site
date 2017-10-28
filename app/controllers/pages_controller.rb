class PagesController < ApplicationController
  before_action :set_admin_traits, only: [:home, :download_resume]

  def home
    @message = Message.new
    @admin_traits
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
   cookies['fileDownload'] = 'true'
    data = open( @admin_traits.resume.url )
    send_data(
       data.read,
      filename: "SebastianValdez_Resume.pdf",
      type: 'application/pdf',
      disposition: 'attachment',
      buffer_size: '4096'
    )
  end

  private
    def set_admin_traits
      @admin_traits = Trait.live_admin_posts.first
    end
      
    def message_params
      params.require(:message).permit(
                              :name,
                              :subject,
                              :sender_email,
                              :body )
    end
end
