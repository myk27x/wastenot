# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'myk27x@yahoo.com', password: 'bananas27')
Transporter.create(user_id: 1, name: 'Michael Reed', cell_phone: '7274235459')
