class TenantsController < ApplicationController

  def show
  	@user = User.with_attached_avatar.includes(hostel_entries: :rent_entries).find(params[:id])
    @hostel_entry = @user.hostel_entries.first
    @rooms = Room.all
  end

  def index
  	@users = User.with_attached_avatar.includes(:hostel_entries)
  	@current_users = User.with_attached_avatar.includes(:hostel_entries).where(hostel_entries: { vacated: false })
  	@vacated_users = User.with_attached_avatar.includes(:hostel_entries).where(hostel_entries: { vacated: true })
    @due_rent_users = User.with_attached_avatar.includes(:hostel_entries).where.not( hostel_entries: { total_rent_due: 0})
  end

end