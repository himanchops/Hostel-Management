class RoomsController < ApplicationController
  def index
  	@rooms = Room.includes(:users)
  end

  def show
  	@room = Room.find(params[:id])
  	@users = @room.users.includes(:hostel_entries).where(hostel_entries: { vacated: false })
  end

end
