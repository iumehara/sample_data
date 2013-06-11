namespace :sample_data do

  desc "Fill database with sample companies"
  task companies: :environment do
    10.times do |n|
      name           = Faker::Company.name
      street_address = Faker::Address.street_address
      city           = Faker::Address.city
      state          = Faker::Address.state_abbr
      zip            = Faker::Address.zip_code
      phone          = rand(111111111..9999999999)
      email          = "Company-#{n+1}@example.com"
      password       = "foobar"
      User.create!(name: name,
                      bio: street_address + ", " + city + ", " + state + " " + zip,
                      email: email,
                      phone: phone
                      password: password,
                      password_confirmation: password)
    end
  end

  desc "Fill database with sample staff"
  task users: :environment do
    30.times do |n|
      name          = Faker::Name.name
      company_id    = rand(1..10)
      email         = "staff-#{n+1}@example.com"
      password      = "foobar"
      User.create!(name: name,
                   company_id: company_id,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end


  desc "Fill database with sample menu items"
  task menus: :environment do
    100.times do |n|
      food_origin   = Faker::Address.city
      food_base     = ["lager", "ale", "wine", "cocktail", "spritzer", "pizza", "pasta", "sandwich", "wings", "roll"]
      company_id    = rand(1..10)
      Menu.create!(name: food_origin + " " + food_base[rand(0..9)],
                   company_id: company_id)
    end
  end  
end


# COMMENTS

# Uses the faker gem
# http://rubydoc.info/github/stympy/faker/master/frames
# gem 'faker'


