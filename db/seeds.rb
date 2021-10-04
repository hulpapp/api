# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

address = [{cep:'31014-174', street:'floresta', number: 96, city: 'Belo Horizonte',state:'MG',country: 'Brazil'},
           {cep:'31990-360', street:'nazare', number: 105, city: 'Belo Horizonte',state:'MG',country: 'Brazil'},
           {cep:'31990-360', street:'santa tereza', number: 250, city: 'Belo Horizonte',state:'MG',country: 'Brazil'}
]


volunteers = [
  {name:"Fulano",email:"Fulano@hotmail.com", telephone:'3133334444',cpf: "001.234.567-89",identity:'012354567',user_role:"organizator"},
  {name:"Aqualung",email:"parker@hotmail.com", telephone:'3122224444',cpf: "111.234.567-89",identity:'22354567',user_role:"responsavel"},
  {name:"pangolin",email:"pangolin@hotmail.com", telephone:'3111115555',cpf: "333.234.567-89",identity:'33354567',user_role:"volunteer"}
]


volunteers.each_with_index  do |volunteer, index |
  puts volunteer[:name]
  user = User.create(email:volunteer[:email],
              password:volunteer[:name],
              password_confirmation:volunteer[:name])


  puts user, index
  puts address[index]
  user_address = Address.create(address[index])

  Volunteer.find_by_user_id(user.id)? puts("this users already exist : ", user.email) : Volunteer.create(name:volunteer[:name],
                                                                                               telephone: volunteer[:telephone],
                                                                                               email: volunteer[:email],
                                                                                               cpf: volunteer[:cpf],
                                                                                               identity: volunteer[:identity],
                                                                                               user_role: volunteer[:user_role],
                                                                                               address_id: user_address.id,
                                                                                               user_id: user.id)

end
