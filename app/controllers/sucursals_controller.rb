class SucursalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_sucursal, only: %i[ show edit update destroy ]

  # GET /sucursals or /sucursals.json
  def index
    @branch_offices = Sucursal.all
  end

  # GET /sucursals/1 or /sucursals/1.json
  def show; end
  
  # GET /sucursals/new
  def new
    @branch_office = Sucursal.new
    @schedules = Schedule.all
  end

  # GET /sucursals/1/edit
  def edit; end
  
  # POST /sucursals or /sucursals.json
  def create
    @branch_office = Sucursal.new(sucursal_params)

    respond_to do |format|
      if @branch_office.save
        format.html { redirect_to sucursal_url(@branch_office), notice: "Sucursal was successfully created." }
        format.json { render :show, status: :created, location: @branch_office }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sucursals/1 or /sucursals/1.json
  def update
    respond_to do |format|
      if @branch_office.update(sucursal_params)
        format.html { redirect_to sucursal_url(@branch_office), notice: "Sucursal was successfully updated." }
        format.json { render :show, status: :ok, location: @branch_office }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sucursals/1 or /sucursals/1.json
  def destroy
    @turns = Turn.where(sucursal_id: @branch_office.id)
    @employees = User.where(sucursal_id: @branch_office.id)
    if(@employees.empty?)
      if(@turns.empty?)
        @branch_office.destroy
        respond_to do |format|
          format.html { redirect_to sucursals_url, notice: "Sucursal was successfully destroyed." }
          format.json { head :no_content }
        end
      else
        @branch_office.errors.add(:sucursal," no se puede eliminar porque tiene turnos asignados")
        respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @branch_office.errors, status: :unprocessable_entity }
        end
      end
    else
      @branch_office.errors.add(:sucursal," no se puede eliminar porque tiene empleados asignados")
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch_office.errors, status: :unprocessable_entity } 
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sucursal
      @branch_office = Sucursal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sucursal_params
      params.require(:sucursal).permit(:nombre, :dirección, :telefono, :schedule_id)
    end
end