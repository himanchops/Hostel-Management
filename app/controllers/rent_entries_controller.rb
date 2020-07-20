class RentEntriesController < ApplicationController
	def new
		
	end

	def create
		@user = User.find(params[:user_id])
		@hostel_entry = HostelEntry.find(params[:hostel_entry_id])
		@rent_entry = @hostel_entry.rent_entries.build(rent_entry_params)

		respond_to do |format|
	    	if @rent_entry.save
	      		format.js
	      		format.html { redirect_to @user, notice: 'Rent entry added.' }
	      		format.json { render :user, status: :created, location: @rent_entry }
	    	else
	      		format.html { render :new }
	      		format.json { render json: @rent_entry.errors, status: :unprocessable_entity }
	    	end
	  	end
	end

	def edit
	end

	def destory
	end

	private
		def rent_entry_params
			params.permit(:from_date, :to_date, :rent, :amount_paid)
		end
end
