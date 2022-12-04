class SucursalsController < ApplicationController
  before_action :set_sucursal, only: %i[ show edit update destroy ]

  # GET /sucursals or /sucursals.json
  def index
    @sucursals = Sucursal.all
  end

  # GET /sucursals/1 or /sucursals/1.json
  def show
  end

  # GET /sucursals/new
  def new
    @sucursal = Sucursal.new
  end

  # GET /sucursals/1/edit
  def edit
  end

  # POST /sucursals or /sucursals.json
  def create
    @sucursal = Sucursal.new(sucursal_params)

    respond_to do |format|
      if @sucursal.save
        format.html { redirect_to sucursal_url(@sucursal), notice: "Sucursal was successfully created." }
        format.json { render :show, status: :created, location: @sucursal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1 or /sucursals/1.json
  def update
    respond_to do |format|
      if @sucursal.update(sucursal_params)
        format.html { redirect_to sucursal_url(@sucursal), notice: "Sucursal was successfully updated." }
        format.json { render :show, status: :ok, location: @sucursal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursals/1 or /sucursals/1.json
  def destroy
    @turnos = Turn.where(state: 0,sucursal_id: @sucursal.id)
    if(@turnos.empty?)
    @sucursal.destroy
    respond_to do |format|
      format.html { redirect_to sucursals_url, notice: "Sucursal was successfully destroyed." }
      format.json { head :no_content }
    end
    else
      @sucursal.errors.add(:sucursal," no se puede eliminar porque tiene turnos pendientes")
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sucursal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sucursal_params
      params.require(:sucursal).permit(:nombre, :dirección, :telefono, :schedule_id)
    end
end
