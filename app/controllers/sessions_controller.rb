class SessionsController < ApplicationController
	def new  
		if current_user 
			redirect_to root_path 
		else 
			@user = User.new 

		end 
 	end 

	def create 
		#if they're authenticated, then create a session equal to the id of 
		#that particular author in the database  
		user = User.where(email: params[:session][:email]).first
		if user && user.authenticated?(params[:session][:password])
			session[:user_id]=user.id 
			redirect_to root_path
		else
			render action: "new"
		end
	end 


	def destroy 
		session[:user_id] = nil
		redirect_to new_sessions_path



	end 	









end
