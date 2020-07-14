class TenantsController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @hostel_entry = @user.hostel_entries.reload.first
    @rooms = Room.all
  end

  def update
    @user = User.find(params[:id])
    if @user.hostel_entries.empty?
      @hostel_entry = @user.hostel_entries.build(hostel_entry_params) 
      if @hostel_entry.save
        flash[:notice] = "New hostel entry added successfully"
      else
        flash[:notice] = "Unsuccessful entry"
      end
    else
      if @user.hostel_entries.update(hostel_entry_params)
        flash[:notice] = "Hostel Entry updated successfully"
      else
        flash[:alert] = "Unsuccessful entry"
      end
    end
    redirect_to @user
  end


  private
  	def hostel_entry_params
  		params.require(:hostel_entry).permit(:joining_date, :vacate_date, :booking_date, :deposit, :room_id)
  	end
end



# FOR INDEX ACTION
# @messages = Message.all.with_attached_images