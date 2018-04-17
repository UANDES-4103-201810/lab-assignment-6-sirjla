class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.find_by(email: params[:session][:email])
		if user.present? && user.password == params[:session][:password]
      flash[:notice] = "You have successfully logged in."
      session[:current_user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Please put valid information."
      redirect_to registrations_url
    end
	end

	def destroy
		session.data.delete :current_user_id
	end
end
