# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

orgs = Organization.create({name: 'Colorado Spirit Home Care'})


12.times do |i| 
  clients = Client.create({
    organization_id: 1,
    medicaid: "abc123#{i}",
    last_name: 'Doe',
    first_name: 'Jane',
    ssi: '123456789',
    phone_number: '3035555555',
    address: '123 Fake St',
    city: 'Boulder',
    state: 'CO',
    postal_code: '80013',
    case_manager: 'Robert Evans',
    manager_phone: '3035555555',
    date_of_birth: Time.now,
    par_expiration: Time.now,
    emergency_contact_info: 'John, 222-2222'
  })
end

providers = Provider.create({
  last_name: 'Dobson',
  first_name: 'John',
  ssi: '123456',
  phone_number: '555-5555',
  address: '124 Not Real St',
  city: 'Boulder',
  state: 'CO',
  postal_code: '80302',
  emergency_contact_info: 'Joe, 555-5556',
  staff_evaluation_date: Time.now,
  safety_training_date: Time.now,
  id_expiration_date: Time.now,
  work_authorization_expiration: Time.now,
  organization_id: 1
})

careplans = Careplan.create({
  organization_id: 1,
  provider_id: Provider.first.id,
  client_id: Client.first.id,
  start_date: Time.now,
  procedure_code: '123'
})
