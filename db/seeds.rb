# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.create(name:"guitar")
Instrument.create(name:"voice")
Instrument.create(name:"drums")
Instrument.create(name:"bass")

Genre.create(name:"rock")
Genre.create(name:"pop")
Genre.create(name:"hip-hop")
Genre.create(name:"country")
