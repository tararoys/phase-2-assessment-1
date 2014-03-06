require 'faker'

User.delete_all
Event.delete_all

  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => "test@test.com",
                :birthdate  => Date.today - 15.years - rand(20000).days,
                :password => "password",
                :password_confirmation => "password" )


# Create 500 users
users = 30.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :birthdate  => Date.today - 15.years - rand(20000).days,
                :password => "password",
                :password_confirmation => "password" )
end

100.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create!( :user_id    => users[rand(users.length)].id,
                 :name       => Faker::Company.name,
                 :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                 :starts_at  => start_time,
                 :ends_at    => end_time )
end



the_only_event_worth_attending = EventAttendance.create( user_id: 1, event_id: 1) 
2.times do 

    start_time = Time.now + (rand(61) - 30).days
    end_time   = start_time + (1 + rand(6)).hours
    
Event.create!( :user_id    => 1,

                 :name       => Faker::Company.name,
                 :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                 :starts_at  => start_time,
                 :ends_at    => end_time )
end