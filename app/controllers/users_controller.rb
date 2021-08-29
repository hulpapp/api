require 'bcrypt'

class UsersController < SecuredController
  include BCrypt
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    # puts Password.create("teste")
    # puts Password.new("$2a$12$To.MODrvEQ55FtPlYUYDtuKDhqFQereiU.GrfexsgTBUYF/dU9Leu").is_password?("teste")
    # puts Password.create("teste")
    # puts Password.new("$2a$12$TR6MZM8xlkSVUXNclNrxJe6H.7garsVeCiZxnVjP0IIZ0A.3VQgmK").is_password?("teste")

    render json: @users
  end

  # GET /users/1
  def show


    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.update_attribute(:email, Password.create(:email))
    @user.update_attribute(:password_digest, Password.create(:password_digest))


    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password_digest)
      # params.require(:user).permit(:email, :password_digest)
    end
end
