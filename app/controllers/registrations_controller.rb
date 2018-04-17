class RegistrationsController < ApplicationController
	def new
	
	end

	def create
    user = User.new(registration_params)
    if user.save
      flash[:notice] = "You have successfully registered."
      redirect_to root_url
    else
      flash[:notice] = "Please put valid information."
      redirect_to registrations_url
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def registration_params
    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
  end
end
