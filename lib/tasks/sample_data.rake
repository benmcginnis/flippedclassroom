namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admins
    #make_users
    #make_microposts
    #make_relationships
    make_lessons
  end
end

def make_lessons
  puts 'making lessons'

  6.times do |n|
    name = "Lesson #{n+1}"
    Lesson.create(name: name)

  end

end

def make_admins

  puts 'making admins'

  admin = User.create!(name: "Ben McGinnis",
               email: "mcginnisb@gmail.com",
               password: "secret100",
               password_confirmation: "secret100",
               section: 1)

  admin.toggle!(:admin)
  admin.section = 0

  moLu = User.create!(name: "Maureen Lucas",
               email: "lucasma@pwcs.edu",
               password: "margaret",
               password_confirmation: "margaret",
               section: 1)

  moLu.toggle!(:admin)
  moLu.section = 0

end

def make_users

  puts 'making users'

  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    section   = [1, 2, 3].sample
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 section: section)
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