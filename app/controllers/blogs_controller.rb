class BlogsController < ApplicationController
	layout 'blog_layout'
	before_action :set_blog, only: [ :show, :edit, :update, :destroy, :toggle_status ]

	def index
		if logged_in? :admin
			@blogs = Blog.all
		elsif logged_in? :editor
			@blogs = Blog.pending_editor_approval
		else
			@blogs = Blog.published.recent
		end
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

	def show
	end

	def edit
	end

	def set_pendng_to_approved blog
		# TODO
		# where if an edit action is complete prompt editor if they would like to make approved
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
      	# set_edits_to_pending @blog
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
	def destroy
		@blog.destroy!
		redirect_to blogs_path, notice: 'Successfully deleted the blog.'
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
			params.require(:blog).permit(:title, :subtitle, :content)
		end
end
