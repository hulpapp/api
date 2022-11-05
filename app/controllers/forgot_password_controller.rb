class ForgotPasswordController < ApplicationController

  def redefine_password
    @@user = User.find_by_email user_params[:email]

    if !@@user.nil?

      @@vol = Volunteer.find_by_user_id @@user

      if @@vol.cpf.eql? params[:cpf]

        @@user.update!( user_params)
        render json: {
          200 => "Usuario #{@@user.email} foi alterado com sucesso"
        }
      else
        render json: {
          300 => "CPF inválido"
        }
      end
    else
      render json: {
        404 => "Usuário não encontrado ou não existe"
      }
    end


  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
