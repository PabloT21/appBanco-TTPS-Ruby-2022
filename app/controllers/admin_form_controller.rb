class AdminFormController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new_admin
    authorize! :create_priv_users, :ad_form
    @user = User.new
  end

  def send_admin_form
    authorize! :create_priv_users, :ad_form

    @user = User.new
    @data = params[:user]

    @user.email       = @data[:email]
    @user.rol         = @data[:rol]
    @user.password    = @data[:password]
    @user.sucursal_id = 0

    if not (@data[:password] == @data[:password_confirmation])
      flash[:errorF] = "Las contraseñas deben coincidir"
      redirect_to "/form_admin"
    elsif @user.save
      redirect_to "/", :notice => 'Se agrego un nuevo administrador!'
    else
      flash[:errorF] = flash[:errorF].to_a.concat resource.errors.full_messages
      redirect_to "/form_admin"
    end
  end

  def new_empleado
    authorize! :create_priv_users, :ad_form
    @user = User.new
    @sucursals = Sucursal.all
  end

  def send_empleado_form
    authorize! :create_priv_users, :ad_form

    @user = User.new
    @data = params[:user]

    @user.email    = @data[:email]
    @user.rol      = @data[:rol]
    @user.password = @data[:password]

    if (@data[:sucursal_id].empty?)
      flash[:errorF] = "Tenes que ingresar una sucursal valida"
      redirect_to "/form_empleado"
    else
      @user.sucursal_id = @data[:sucursal_id]
    if not (@data[:password] == @data[:password_confirmation])
      flash[:errorF] = "Las contraseñas deben coincidir"
      redirect_to "/form_empleado"
      elsif @user.save
        redirect_to "/", :notice => 'Se agrego un nuevo empleado!'
      else
        flash[:errorF] = flash[:notice].to_a.concat resource.errors.full_messages
        redirect_to "/form_empleado"
      end
    end
  end

  def password_form; end

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