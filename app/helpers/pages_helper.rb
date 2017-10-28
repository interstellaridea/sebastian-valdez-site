module PagesHelper
	def profile_picture_helper item
		unless item.respond_to? :profile_picture
			fa_icon('user', text: tag(:br) + content_tag(:span, 'profile Picture').html_safe, class: 'fa-3x')
		else
			image_tag(item.profile_picture, alt: "Me", id: "profile-pic", class: 'img-fluid')
		end
	end

end
