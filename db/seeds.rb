# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 10.times do
#    Post.create        title: Faker::Company.catch_phrase

,
#                       body: Faker::Hipster.paragraph
# end
10.times do
  Comment.create(body: Faker::Company.catch_phrase)
end

["Technology","Sports","Medical","Social","Education","Politics","Economics","Transportation","Tourism","Human Resources"].each do|cat|
  Category.create(title:cat)

end
