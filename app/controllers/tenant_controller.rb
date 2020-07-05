class TenantController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@hostel_entry = @user.hostel_entry
  end

  def index
  end

  private
  	def hostel_entry_params
  		params.require(:user).permit(:hostel_entries_attributes => [:joining_date, :vacate_date, :booking_date, :deposit])
  	end
end

