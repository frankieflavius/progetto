class PazientesController < ApplicationController

before_action :set_paziente, only: [:show, :edit, :update, :destroy]

  # GET /pazientes
  # GET /pazientes.json
  def index
   @pazientes = Paziente.all.paginate(page: params[:page], :per_page => 15)
    
  end

  # GET /pazientes/1
  # GET /pazientes/1.json
  def show
    id = params[:id]
    @paziente = Paziente.find(id)
    session[:test_id]=@paziente.id
  end

  # GET /pazientes/new
  def new
    @paziente = Paziente.new
  end

  # GET /pazientes/1/edit
  def edit
    id = params[:id]
    @paziente = Paziente.find(id)
  end

  # POST /pazientes
  # POST /pazientes.json
  def create
    @paziente = Paziente.new(paziente_params)
    respond_to do |format|
      if @paziente.save
        format.html { redirect_to @paziente, notice: 'Il Paziente è stato creato con successo.' }
        format.json { render :show, status: :created, location: @paziente }
      else
        format.html { render :new }
        format.json { render json: @paziente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pazientes/1
  # PATCH/PUT /pazientes/1.json
  def update
    id = params[:id]
    @paziente = Paziente.find(id)
    respond_to do |format|
      if @paziente.update(paziente_params)
        format.html { redirect_to @paziente, notice: 'Il Paziente è stato aggiornato con successo.' }
        format.json { render :show, status: :ok, location: @paziente }
      else
        format.html { render :edit }
        format.json { render json: @paziente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pazientes/1
  # DELETE /pazientes/1.json
  def destroy
    id = params[:id]
    @paziente = Paziente.find(id)
    @paziente.destroy
    respond_to do |format|
      format.html { redirect_to pazientes_url, notice: 'Il Paziente è stato cancellato con successo.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paziente
      @paziente = Paziente.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def paziente_params
      params.require(:paziente).permit(:id,:nome, :cognome, :email, :telefono, :password)
    end
end
