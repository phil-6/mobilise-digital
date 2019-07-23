# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(
        email: 'testadmin@purupleriver.dev',
        first_name: 'Admin',
        last_name: 'Reynolds',
        password: 'admintest',
        admin: 'true'
)
100.times do
  User.create(
       email: Faker::Internet.unique.free_email,
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       password: 'test123mob',
       address_company: Faker::Company.name,
       address_1: Faker::Address.street_address,
       address_2: Faker::Address.community,
       address_town: Faker::Address.city,
       address_county: Faker::Address.state
  )
end