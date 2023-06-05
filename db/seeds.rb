# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

address = [{cep:'31014-174', street:'floresta', number: 96, city: 'Belo Horizonte',state:'MG'},
           {cep:'31990-360', street:'nazare', number: 105, city: 'Belo Horizonte',state:'MG'},
           {cep:'31990-360', street:'santa tereza', number: 250, city: 'Belo Horizonte',state:'MG'},
           {cep:'31990-360', street:'santa tereza', number: 250, city: 'Belo Horizonte',state:'MG'},
]
#
#
volunteers = [
  {name:"Outro user",email:"johnf@hotmail.com", telephone:'3133334444',cpf: "001.234.567-89",identity:'012354567'},
  {name:"Vicente",email:"mateussailva@hotmail.com", telephone:'3122224444',cpf: "111.234.567-89",identity:'22354567'},
  {name:"Test Magazine",email:"luizaaMagazine@hotmail.com", telephone:'3111115555',cpf: "333.234.567-89",identity:'33354567'},
  {name:"Joana P Prates",email:"joanaacprates@hotmail.com", telephone:'3111115555',cpf: "333.234.567-89",identity:'33354567'},
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
                                                                                               address_id: user_address.id,
                                                                                               user_id: user.id)

end
# events = [{user_id:1, name: 'coleta de alimentos', city:'BH', detail: 'dia nacional' }]
# events.each do |event|
#   Event.create(user_id:event[:user_id], name:event[:name],city:event[:city],detail:event[:detail])
# end


# donations = [{event_id:1,category: 'feijao', quantity:'1', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'batata', quantity:'1', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'feijao', quantity:'2', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'farinha', quantity:'2', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'feijao', quantity:'20', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'farofa', quantity:'2', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'arroz', quantity:'2', position: 'BH pampulha', destination:'sesc-mg'},
#              {event_id:1,category: 'arroz', quantity:'2', position: 'BH pampulha', destination:'sesc-mg'}
# ]
#
# donations.each do |donation|
#   Donation.create(event_id:donation[:event_id],
#                   category: donation[:category],
#                   quantity:donation[:quantity],
#                   position: donation[:position],
#                   destination:donation[:destination])
#
# end
