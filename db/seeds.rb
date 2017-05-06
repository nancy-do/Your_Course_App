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
Category.create!(name:"Java")
Category.create!(name:"Full Stack Dev")
Category.create!(name:"Application Development")

Course.create!(name:"Programming 1", prerequisite: "Professional Computing Practise", description:"Example Description" )
Course.create!(name:"Professional Computing Practise", prerequisite: "Programming 1", description:"Example Description" )
Course.create!(name:"Rapid Application Development", prerequisite: "Programming 1", description:"Example Description" )

Course.first.locations << Location.find(1)
Course.second.locations << Location.find(2)
Course.third.locations << Location.find(3)

Course.first.categories << Category.find(2)
Course.second.categories << Category.find(2)
Course.third.categories << Category.find(1)

