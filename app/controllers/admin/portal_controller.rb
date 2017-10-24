class Admin::PortalController < ApplicationController

	# instead go to user path devise and be able to upload traits


  def index
  	@traits = Trait.all
  end

  def new
  	@user_items = Trait.new
  end

  def create
    binding.pry
  	@user_items = Trait.new(trait_params)
  	@user_items.user_id = current_user.id
  	if @user_items.valid?
  		@user_items.save!
  		flash[:success] = 'You succesfully Uploaded a new resume version!'
  		redirect_to admin_portal_path
  	else
  		flash[:error] = 'Failed to upload new items'
  		render :new
  	end
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end


  private

  def trait_params
	  params.require(:trait).permit(:resume, :profile_picture)
  end


  def set_user
  	@traits = Trait.find(current_user.id)
  end




end
