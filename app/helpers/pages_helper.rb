module PagesHelper
	def profile_picture_helper item
		unless item.respond_to? :profile_picture
			fa_icon('user', text: tag(:br) + content_tag(:span, 'profile Picture').html_safe, class: 'fa-3x')
		else
			image_tag(item.profile_picture, alt: "Me", id: "profile-pic", class: 'img-fluid')
		end
	end

	def intro_resume_helper item
		link_to( 'Resume', download_resume_path, class: 'btn btn-info btn-block') if item.respond_to? :resume
	end

end
