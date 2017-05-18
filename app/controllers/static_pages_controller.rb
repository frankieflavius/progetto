class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def home

  end
  def live_search
  nome_p=params[:nome_p]
  cognome_p=params[:cognome_p]
  @paziente = Paziente.where(nome: nome_p, cognome: cognome_p)

  if(@paziente.count==0)
	flash[:info]= "Paziente non trovato"  
	redirect_to(:back)
	
  elsif(@paziente.count >1)
	render 'static_pages/live_search'
  
  elsif
  @paziente.find_each do |paziente|
	redirect_to "http://localhost:3000/pazientes/" + paziente.id.to_s
  end
  end
	
  end
end
