

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    params[:user][:birthday] = birthday_join
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  # POST /resource
  def create_address
    # binding.pry
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
    redirect_to root_path
  end


  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])

    def birthday_join
      # パラメータ取得
      date = params[:user][:birthday]
    end
  

  end

  def address_params
    params.require(:address).permit(:prefecture_id, :zipcode, :city, :address, :building, :phone_number )
  end

end
