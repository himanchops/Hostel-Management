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
        redirect_to @user
      else
        flash[:notice] = "Unsuccessful entry"
        @user.hostel_entries.reload
        render 'show'
      end
    else
      if @user.hostel_entries.update(hostel_entry_params)
        flash[:notice] = "Hostel Entry updated successfully"
        redirect_to @user
      else
        flash[:alert] = "Unsuccessful entry"
        @user.hostel_entries.reload
        render 'show'
      end
    end
  end


  private
  	def hostel_entry_params
  		params.require(:hostel_entry).permit(:joining_date, :vacate_date, :booking_date, :deposit, :room_id)
  	end
end

