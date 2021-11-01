class SessionController < ApplicationController


  def signup
    @user = User.find_by_email(user_params[:email])

    if @user.nil?
    @user = User.create(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation])
    end

    unless @user.nil?
      @address = Address.create(
        cep: user_params[:cep],
        street: user_params[:street],
        number: user_params[:number],
        city: user_params[:city],
        state: user_params[:state],
        country: user_params[:country])

      @volunteer = Volunteer.find_by_user_id(@user.id)
      if @volunteer.nil?
        @volunteer = Volunteer.create(
          name: user_params[:name],
          email: user_params[:email],
          user_id: @user.id,
          telephone: user_params[:telephone],
          cpf: user_params[:cpf],
          identity: user_params[:identity],
          address_id: @address.id
        )
        render json: 201
      else
        render json: 'Volunteer already exists'

      end

    end


  end

  def user_params
    params.permit(:email, :password, :password_confirmation, :name, :telephone, :cpf, :identity, :cep, :street, :number, :city, :state, :country)
  end
end
