class Admin::PortalController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_trait, only: [ :destroy, :toggle_status ]
  access admin: :all

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

  def toggle_status
    if @user_item.off?
      @user_item.live!
    elsif @user_item.live?
      @user_item.off!
    end
      redirect_to admin_portals_path, notice: "You've successfully updated your trait"
  end

  def destroy
    @user_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_portals_path, notice: 'User Trait were successfully destroyed' }
      format.json { head :no_content }
    end
  end


  private
  def set_user_trait
    @user_item = current_user.traits.find(params[:id])
  end
  def trait_params
	  params.require(:trait).permit(:resume, :profile_picture)
  end
end
