class TenantsController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @hostel_entry = @user.hostel_entries.reload.first
    @rooms = Room.all
  end

  def index
  	@users = User.with_attached_avatar.includes(:hostel_entries)
  	@current_users = User.with_attached_avatar.includes(:hostel_entries).where(hostel_entries: { vacated: false })
  	@vacated_users = User.with_attached_avatar.includes(:hostel_entries).where(hostel_entries: { vacated: true })
  end

end