require 'bcrypt'

class SessionController < SecuredController
  include BCrypt

  def login
    @user = User.new(user_params)


    if @user.password_digest == User.find_by_email(@user.email).password_digest
      render json: {
        "response":"202",
        "volunteer_data": Volunteer.find_by_email(params[:email])
      }
    else
      render json: 401
    end
  end

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
