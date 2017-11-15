module BlogsHelper

	def blog_link_generator blog
		states = Blog.statuses.keys
		if logged_in? :editor
			states.delete_if{ |state| state =~ /draft|published/ }
		end
		states.map{|state| link_to "#{state}", toggle_status_blog_path(blog,state), class: "btn btn-sm #{blog_status?(blog, state)}" }.join.html_safe
	end

	def blog_status? blog, state
		if blog.status == state
			case state
				when 'draft'
					'btn-info'
				when 'pending'
					'btn-warning'
				when 'approved'
					'btn-success'
				when 'published'
					'btn-primary'
				else
					'btn-secondary'
			end
		else
			'btn-secondary'
		end
	end

end
