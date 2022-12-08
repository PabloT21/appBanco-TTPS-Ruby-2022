class AdminFormController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def newForm
    @user = User.new
  end

  def sendForm
    @user = User.new
    @data = params[:user]
    @user.email = @data[:email]
    @user.rol = @data[:rol]
    @user.password = @data[:password]
    @user.sucursal_id = 0

    if @user.save
      redirect_to user_path, :notice => 'New Administrator has been added'
    else
      render :action => "newForm"
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