class AdminFormController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def newAdmin
    authorize! :createPrivUsers, :adForm
    @user = User.new
  end

  def sendAdminForm
    authorize! :createPrivUsers, :adForm

    @user = User.new
    @data = params[:user]
    @user.email = @data[:email]
    @user.rol = @data[:rol]
    @user.password = @data[:password]
    @user.sucursal_id = 0

    if not (@data[:password] == @data[:password_confirmation])
      flash[:errorF] = "Las contraseñas deben coincidir"
      redirect_to "/formAdmin"
    elsif @user.save
      redirect_to "/", :notice => 'Se agrego un nuevo administrador!'
    else
      flash[:errorF] = flash[:errorF].to_a.concat resource.errors.full_messages
      redirect_to "/formAdmin"
    end
  end

  def newEmpleado
    authorize! :createPrivUsers, :adForm
    @user = User.new
    @sucursals = Sucursal.all
  end

  def sendEmpleadoForm
    authorize! :createPrivUsers, :adForm
    @user = User.new
    @data = params[:user]
    @user.email = @data[:email]
    @user.rol = @data[:rol]
    @user.password = @data[:password]
    if (@data[:sucursal_id].empty?)
      flash[:errorF] = "Tenes que ingresar una sucursal valida"
      redirect_to "/formEmpleado"
    else
      @user.sucursal_id = @data[:sucursal_id]
    if not (@data[:password] == @data[:password_confirmation])
      flash[:errorF] = "Las contraseñas deben coincidir"
      redirect_to "/formEmpleado"
      elsif @user.save
        redirect_to "/", :notice => 'Se agrego un nuevo empleado!'
      else
        flash[:errorF] = flash[:notice].to_a.concat resource.errors.full_messages
        redirect_to "/formEmpleado"
      end
    end
  end

  def passwordForm
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