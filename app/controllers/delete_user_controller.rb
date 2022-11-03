class DeleteUserController < SecuredController

  def deleteAllUserData
    @@user = User.find @decoded[:user_id]

    if !@@user.nil?

      @@gambi = Gambi.find_by_volunteer_id @decoded[:volunteer_id]

      @@vol = Volunteer.find @decoded[:volunteer_id]

      unless @@gambi.nil?
        Gambi.destroy @@gambi
      end



      unless @@vol.nil?
        @@address_id =  @@vol.address_id
        Volunteer.destroy @@vol
        Address.destroy @@address_id
      end

      User.destroy @@user

      render json: {
        "GOOD-BYE USER!" => "Best regards"
      }
    else
      render json: {
        230 => "Nada aconteceu"
      }
    end

  end
end
