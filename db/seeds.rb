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
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.cell_phone
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state

  Admin.create(first_name: first_name, last_name: last_name, email: email, phone: phone, address_1: address_1, address_2: address_2, city: city, zip: zip, state: state)
end

10.times do
  admin_id = Faker::Number.between(from: 1, to: 10)
  job_id = Faker::Number.between(from: 1, to: 10)
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.cell_phone
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state

  Client.create(admin_id: admin_id, job_id: job_id, first_name: first_name, last_name: last_name, email: email, phone: phone, address_1: address_1, address_2: address_2, city: city, zip: zip, state: state)
end

10.times do
  admin_id = Faker::Number.between(from: 1, to: 10)
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.cell_phone
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state

  User.create(admin_id: admin_id, first_name: first_name, last_name: last_name, email: email, phone: phone, address_1: address_1, address_2: address_2, city: city, zip: zip, state: state)
end

# the datetime isn't populating. the code is correct here, but I think the t.datetime wants a differnt format?

10.times do
  admin_id = Faker::Number.between(from: 1, to: 10)
  client_id = Faker::Number.between(from: 1, to: 10)
  address_1 = Faker::Address.street_address
  address_2 = Faker::Address.secondary_address
  city = Faker::Address.city
  zip = Faker::Address.zip
  state = Faker::Address.state


  # job_start_datetime = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  # job_end_datetime = Faker::Time.between(from: DateTime.now + 10, to: DateTime.now + 500)

  Job.create(admin_id: admin_id, client_id: client_id, address_1: address_1, address_2: address_2, city: city, zip: zip, state: state)
end

