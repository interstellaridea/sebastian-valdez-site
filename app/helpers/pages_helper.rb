module PagesHelper
	def profile_picture_helper item
		unless item.respond_to? :profile_picture
			fa_icon('user', text: tag(:br) + content_tag(:span, 'profile Picture').html_safe, class: 'fa-3x')
		else
			image_tag(item.profile_picture.url, alt: "Me", id: "profile-pic", class: 'img-fluid')
		end
	end

	def intro_resume_helper item
			link_to( 'Resume', download_resume_path, class: 'btn btn-info btn-block') if item.respond_to? :resume
	end

	def footer_resume_helper item
		if item.respond_to? :resume
      content_tag(:li, class: 'list-inline-item text-center jquery-download') do
      	link_to(
      		fa_icon('download', text: tag(:br) + content_tag(:span, 'Resume').html_safe, class: 'fa-3x'),
      		download_resume_path)
			end
		end
	end

end
