class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token 
  def new
 
  end

  def create
    paziente = Paziente.find_by(email: params[:session][:email].downcase)
    if paziente && paziente.authenticate(params[:session][:password])
	log_in paziente
        redirect_to root_url
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash[:danger] = 'email/password non valide'
      render 'new'
    end
  end

 def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
