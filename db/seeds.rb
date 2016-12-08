50.times do |c|
  name  = Faker::Name.name
  Category.create(name: name,)
end

categories = Category.order(:created_at).take(6)
50.times do
  content=Faker::Name.name
  categories.each{|category| category.questions.create(content:content)}
end


User.create!(name:  "HuyMinh Ho",
             email: "minhhuyho@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(8)
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title:title, body: body) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#Create comment
users = User.order(:created_at).take(6)
entry = Entry.first
50.times do
  content = Faker::Lorem.sentence(5)
  users.each {
    |user| user.comments.create!(content: content, entry_id: entry.id )
  }
end
