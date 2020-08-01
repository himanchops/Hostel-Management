class RoomsController < ApplicationController
  def index
  	@rooms = Room.includes(:users)
  end

  def show
  	@room = Room.includes(:users).find(params[:id])
  end
end
