class Admin::PortalController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user_items = current_user.traits
  end

  def new
  	@user_items = current_user.traits.new
  end

  def create
  	@user_items = current_user.traits.new(trait_params)
  	if @user_items.valid?
  		@user_items.save!
  		flash[:success] = 'You succesfully Uploaded a new resume version!'
  		redirect_to admin_portals_path
  	else
  		flash[:error] = 'Failed to upload new items'
  		render :new
  	end
  end

  def destroy
    current_user.traits.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_portals_path, notice: 'User Trait were successfully destroyed' }
      format.json { head :no_content }
    end
  end


  private

  def trait_params
	  params.require(:trait).permit(:resume, :profile_picture)
  end
end
