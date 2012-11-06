namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users

  puts 'making users'

  admin = User.create!(name: "Ben McGinnis",
               email: "mcginnisb@gmail.com",
               password: "secret100",
               password_confirmation: "secret100")

  admin.toggle!(:admin)

  moLu = User.create!(name: "Maureen Lucas",
               email: "lucasma@pwcs.edu",
               password: "margaret",
               password_confirmation: "margaret")

  moLu.toggle!(:admin)

  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts

  puts 'posts'

  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships

  puts "making relationships"

  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end