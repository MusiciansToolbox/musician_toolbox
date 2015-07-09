# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.create(name:"Guitar")
Instrument.create(name:"Voice")
Instrument.create(name:"Drums")
Instrument.create(name:"Bass")

Genre.create(name:"Rock")
Genre.create(name:"Pop")
Genre.create(name:"Hip-Hop")
Genre.create(name:"Country")
