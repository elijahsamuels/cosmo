# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'
# https://github.com/faker-ruby/faker#generators

10.times do
  name = Faker::Company.name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.cell_phone
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state
  mailing_address_1 = Faker::Address.street_address
  mailing_address_2 = Faker::Address.secondary_address
  mailing_city = Faker::Address.city
  mailing_zip = Faker::Address.zip
  mailing_state = Faker::Address.state
  description =  Faker::Company.bs
  ein = Faker::Company.ein
  url = Faker::Internet.domain_name
  
  Business.create(name: name, email: email, phone: phone, address_1: address_1, address_2: address_2, city: city, zip: zip, state: state, mailing_address_1: mailing_address_1, mailing_address_2: mailing_address_2, mailing_city: mailing_city, mailing_zip: mailing_zip, mailing_state: mailing_state, description: description, ein: ein, url: url)
end

# the datetime isn't populating. the code is correct here, but I think the t.datetime wants a differnt format?

10.times do
  # user_id = Faker::Number.between(from: 1, to: 10)
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state
  total_amount = Faker::Number.between(from: 500, to: 50000)
  job_start_datetime = Faker::Time.forward(days: 10, period: :morning) #, format: :default 
  job_end_datetime = Faker::Time.forward(days: 1000, period: :morning)
  description =  Faker::Company.bs
  due_date = Faker::Time.forward(days: 1000, period: :morning)
  deposit_date = Faker::Time.forward(days: 1000, period: :morning)
  paid_date = Faker::Time.forward(days: 1000, period: :morning)

  Job.create(address_1: address_1, address_2: address_2, city: city, zip: zip, state: state, total_amount: total_amount, job_start_datetime: job_start_datetime, job_end_datetime: job_end_datetime, description: description, due_date: due_date, deposit_date: deposit_date, paid_date: paid_date)
end

10.times do
  user = User.new(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.email,
    password: "123456",
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    zip: Faker::Address.zip,
    state: Faker::Address.state,
    phone: Faker::PhoneNumber.cell_phone,
    ssn: Faker::IDNumber.valid
  )
  user.save!
  # User.create(first_name: first_name, last_name: last_name)
  # binding.pry
end