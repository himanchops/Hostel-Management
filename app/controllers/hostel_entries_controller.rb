class HostelEntriesController < ApplicationController

  def create
	 @user = User.find(params[:user_id])
	 @hostel_entry = @user.hostel_entries.build(hostel_entry_params) 
	 if @hostel_entry.save
	   flash[:notice] = "New hostel entry added successfully"
	 else
	   flash[:notice] = "Unsuccessful entry"
   end
   redirect_to @user
  end

  def update
  	@user = User.find(params[:user_id])
	if @user.hostel_entries.update(hostel_entry_params)
		flash[:notice] = "Hostel entry updated successfully"
	else
		flash[:alert] = "Unsuccessful entry"
	end
  	redirect_to @user	  	
  end

  def destroy
  	@user = User.find(params[:user_id])
  	@hostel_entry = @user.hostel_entries.find(params[:id])
  	@hostel_entry.destroy
  	redirect_to @user
  end

  private
  	def hostel_entry_params
  		params.require(:hostel_entry).permit(:joining_date, :vacate_date, :booking_date, :deposit, :room_id, :vacated)
  	end  
end
