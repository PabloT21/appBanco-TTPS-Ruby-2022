class AdminFormController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def newAdmin
    @user = User.new
  end

  def sendAdminForm
    @user = User.new
    @data = params[:user]
    @user.email = @data[:email]
    @user.rol = @data[:rol]
    @user.password = @data[:password]
    @user.sucursal_id = 0

    if @user.save
      redirect_to "/formAdmin", :notice => 'Se agrego un nuevo administrador!'
    else
      render :action => "newAdmin"
    end
  end

  def newEmpleado
    @user = User.new
  end

  def sendEmpleadoForm
    @user = User.new
    @data = params[:user]
    @user.email = @data[:email]
    @user.rol = @data[:rol]
    @user.password = @data[:password]
    if (@data[:sucursal_id].empty?)
      @user.sucursal_id = @data[:sucursal_id]
      flash[:errorF] = "Tenes que ingresar una sucursal valida"
      redirect_to "/formEmpleado"
    else
      if @user.save
        redirect_to "/formEmpleado", :notice => 'Se agrego un nuevo empleado!'
      else
        flash[:errorF] = flash[:notice].to_a.concat resource.errors.full_messages
        render :action => "newEmpleado"
      end
    end
  end



  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end
end