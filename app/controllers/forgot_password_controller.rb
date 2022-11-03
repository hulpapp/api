class ForgotPasswordController < ApplicationController

  def redefine_password
    @@user = User.find_by_email user_params[:email]

    if @@user.nil?
      render json: {
        404=> "Usuário não encontrado ou não existe"
      }
    else
      @@user.update! user_params
      render json: @@user
    end

  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
