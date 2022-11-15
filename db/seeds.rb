# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Idea.destroy_all
Review.destroy_all
User.destroy_all

PASSWORD ="test"

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD,
    )
end

users = User.all

50.times do
    i = Idea.create(
        title: Faker::Marketing.buzzwords + rand(100_000).to_s,
        body: Faker::GreekPhilosophers.quote,
        user: users.sample
    )
    if i.valid?
        rand(1..5).times do
            Review.create(body: Faker::Hacker.say_something_smart, idea: i, user: users.sample)
        end
    end

end

ideas = Idea.all
reviews = Review.all

puts "done generating"