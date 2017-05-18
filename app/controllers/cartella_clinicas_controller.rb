require 'will_paginate/array'
class CartellaClinicasController < ApplicationController

  # GET /cartella_clinicas
  # GET /cartella_clinicas.json
  def index
    @paziente = Paziente.find(session[:test_id])
    @cartella_clinicas = CartellaClinica.all.reject{|cartella_clinica| cartella_clinica.paziente_id!=session[:test_id]}
    @cartella_clinicas = @cartella_clinicas.paginate(page: params[:page], :per_page => 15)
  end

  # GET /cartella_clinicas/1
  # GET /cartella_clinicas/1.json
  def show
    @cartella_clinica=CartellaClinica.find(params[:id])
    @id=session[:test_id]
  end

  # GET /cartella_clinicas/new
  def new
    @cartella_clinica = CartellaClinica.new
  end

  # GET /cartella_clinicas/1/edit
  def edit
    @cartella_clinica = CartellaClinica.find(params[:id])
    
  end

  # POST /cartella_clinicas
  # POST /cartella_clinicas.json
  def create
   
    @id=session[:test_id]
    @cartella_clinica=CartellaClinica.new(cartella_clinica_params)
    respond_to do |format|
      if @cartella_clinica.save
        CartellaClinica.update(@cartella_clinica.id,:paziente_id =>@id) 
        format.html { redirect_to @cartella_clinica, notice: 'La Cartella clinica è stata creata con successo.' }
        format.json { render :show, status: :created, location: @cartella_clinica }
      else
        format.html { render :new }
        format.json { render json: @cartella_clinica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartella_clinicas/1
  # PATCH/PUT /cartella_clinicas/1.json
  def update
    @cartella_clinica = CartellaClinica.find(params[:id])
    respond_to do |format|
      if @cartella_clinica.update(cartella_clinica_params)
        format.html { redirect_to @cartella_clinica, notice: 'La Cartella clinica è stata aggiornata con successo.' }
        format.json { render :show, status: :ok, location: @cartella_clinica }
      else
        format.html { render :edit }
        format.json { render json: @cartella_clinica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartella_clinicas/1
  # DELETE /cartella_clinicas/1.json
  def destroy
    id = params[:id]
    id_paziente = params[:paziente_id]
    @paziente = Paziente.find(id_paziente)
    @cartellaclinica = CartellaClinica.find(id)
    @cartellaclinica.destroy
    respond_to do |format|
      format.html { redirect_to cartella_clinicas_url, notice: 'La Cartella clinica è stata cancellata con successo.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartella_clinica_params
      params.require(:cartella_clinica).permit(:diagnosi, :valutazione_anatomica, :valutazione_funzionale, :iniziale_finale, :anamnesi, :paziente_id, :data, :chiave)
    end
end
