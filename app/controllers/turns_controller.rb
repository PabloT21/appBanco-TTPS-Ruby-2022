class TurnsController < ApplicationController
  load_and_authorize_resource
  before_action :set_turn, only: %i[ show edit update destroy ]

  # GET /turns or /turns.json
  def index
    if current_user.cliente?
      @turns = Turn.where(
        'creador_id = ?',
        current_user.id
      ).group(:id)
    elsif current_user.empleado?
      @turns = Turn.where(
        'sucursal_id = ?',
        current_user.sucursal 
      ).group(:id)
    else
      @turns = Turn.all
    end
  end

  # GET /turns/1 or /turns/1.json
  def show; end
  

  # GET /turns/new
  def new
    @turn = Turn.new
    @sucursals = Sucursal.all
  end

 # GET /turns/1/edit
 def edit; end
 

  # POST /turns or /turns.json
  def create
    @turn = Turn.new(turn_params)
    @turn.creador_id = current_user.id
    respond_to do |format|
      if @turn.save
        format.html { redirect_to turn_url(@turn), notice: "Turn was successfully created." }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /turns or /turns.json
  def finish
    @turno =  params[:turn]
    if @turno[:comentario].empty?
      flash[:errorF] = "El comentario no puede estar vacío"
      redirect_to "/turns"
    else
      @comentario = @turno[:comentario]
      @turn = Turn.find(params[:id])
      @turn.comentario = @comentario
      @turn.empleados_id = current_user.id
      @turn.state = 1
      @turn.save
      redirect_to "/turns", :notice => 'El turno fue atendido correctamente!'
    end
  end



  # PATCH/PUT /turns/1 or /turns/1.json
  def update
    respond_to do |format|
      if @turn.update(turn_params)
        format.html { redirect_to turn_url(@turn), notice: "Turn was successfully updated." }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turns/1 or /turns/1.json
  def destroy
    @turn.destroy
    respond_to do |format|
      format.html { redirect_to turns_url, notice: "Turn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_params
      params.require(:turn).permit(:sucursal_id, :fecha, :reason, :state, :hora, :creador_id, :empleado_id)
    end
end
