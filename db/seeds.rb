# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |n|
    Location.create!(building: n+3 , 
                    level: n+2, 
                    room: n+10)
end 

Category.create!(name:"Web Development")
Categroy.create!(name:"Java")
Categroy.create!(name:"Full Stack Dev")
Categroy.create!(name:"Application Development")

#Courses.create!(name:"Intro to programming", )
#Courses.create!()