class BlogsController < ApplicationController
	before_action :set_blog, only: [ :show, :toggle_status ]

	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)

		if @blog.valid?
			@blog.save!
			redirect_to blogs_path, notice: 'You successfully created a blog!'
		else
			render :new
		end
	end

	def toggle_status
		state = params[:state]
		case state
		 when 'draft'
		 	@blog.draft!
		 when 'pending'
		 	@blog.pending!
		 when 'approved'
		 	@blog.approved!
		 when 'published'
		 	@blog.published!
		 else
		 	@blog.draft!
		 end

		redirect_to blogs_url, notice: "#{@blog.title} status set to #{state}."
	end

	private
		def set_blog
			@blog = Blog.find(params[:id])
		end

		def blog_params
			params.require(:blog).permit(:title, :content)
		end
end
