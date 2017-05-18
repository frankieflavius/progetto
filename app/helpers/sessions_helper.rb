module SessionsHelper

  # Logs in the given user.
  def log_in(paziente)
    session[:paziente_id] = paziente.id
  end
 def log_out
    session.delete(:paziente_id)
    @current_paziente = nil
  end
 def logged_in?
    !current_paziente.nil?
  end
 
def current_paziente
    @current_paziente ||= Paziente.find_by(id: session[:paziente_id])
  end
def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end



