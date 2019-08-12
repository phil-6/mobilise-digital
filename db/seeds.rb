# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

job_keywords = ["aws", "azure", "gcp", "devops", "k8s", "python", "ruby", "ansible", "terraform"]

User.create(
        email: 'testadmin@purpleriver.dev',
        first_name: 'Admin',
        last_name: 'Reynolds',
        password: 'admintest',
        admin: 'true'
)
User.create(
        email: 'testnoadmin@purpleriver.dev',
        first_name: 'NoAdmin',
        last_name: 'Reynolds',
        password: 'noadmintest'
)
User.create(
        email: 'andrew.carpenter@mobilise.cloud',
        first_name: 'Andrew',
        last_name: 'Carpenter',
        password: 'andrewstestpassword',
        admin: 'true'
)
100.times do
  User.create(
       email: Faker::Internet.unique.safe_email,
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       password: 'test123mob',
       address_company: Faker::Company.name,
       address_1: Faker::Address.street_address,
       address_2: Faker::Address.community,
       address_town: Faker::Address.city,
       address_county: Faker::Address.state,
       keywords: job_keywords.sample(3),
       profile_completion: rand(100)
  )
end

150.times do
  Job.create(
         title: Faker::Job.title,
         description: Faker::Hacker.say_something_smart,
         published_date: Faker::Time.between(20.days.ago, Date.today),
         latest_start_date: Faker::Time.forward(20),
         contract_length: '3  Months',
         day_rate: Faker::Number.between(50, 2000),
         working_arrangements: Faker::Job.employment_type,
         address_company: Faker::Company.name,
         address_1: Faker::Address.street_address,
         address_2: Faker::Address.community,
         address_town: Faker::Address.city,
         address_county: Faker::Address.state,
         team: Faker::Commerce.department,
         requirements: Faker::Quote.yoda,
         keywords: job_keywords.sample(3),
         open: true
  )
end

100.times do
  JobApplication.create(
                 user_id: rand(4..100),
                 job_id: rand(150),
                 cover: Faker::Movie.quote
  )
end