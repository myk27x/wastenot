# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'noone@example.com', password: 'sekret27')
Donor.create(user_id: 1, org_name: 'thin air', street_address: '123 Main St.', city: 'Who-ville', state: 'Speck', zip: '14303-327', contact_name: 'Mayor', phone: '+12-34-56-78-90')

User.create(email: 'michael@example.com', password: 'reed1234')
Transporter.create(user_id: 2, name: 'Michael Reed', cell_phone: '+17274235459', open: 19, close: 23)

User.create(email: 'kristen@example.com', password: 'swan1234')
Receiver.create(user_id: 3, org_name: 'Swan Services', street_address: '456 7th St.', city: 'Townsville', state: 'Tokyo', zip: '100-0001-1', contact_name: 'Yuuko Takanashi', phone: '012-3456-7890', open: 6, close: 22, delivery_instructions: 'Make inside package. Send for Japan. Thanking to your.')
