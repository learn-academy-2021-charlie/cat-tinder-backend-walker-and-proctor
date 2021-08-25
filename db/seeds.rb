# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [
    {
        name: 'Felix',
        age: 2,
        enjoys: 'Long naps on the couch, and a warm fire'
    },
    {
        name: 'Garfield',
        age: 10000,
        enjoys: 'lounging, eating lasgana, hauning the multiverse'
    },
    {
        name: 'Jack',
        age: 5,
        enjoys: 'Furrrrociously hunting bugs. Hanging off of floating doors'
    }
]

cats.each do |attributes|
    Cat.create attributes
    puts "creating cat #{attributes}"
end