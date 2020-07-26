class TenantsController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @hostel_entry = @user.hostel_entries.reload.first
    @rooms = Room.all
  end

  def index
  	@users = User.all.with_attached_avatar.includes(:hostel_entries)
  end

end



# FOR INDEX ACTION
# @messages = Message.all.with_attached_images