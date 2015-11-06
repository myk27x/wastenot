# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Anonymous', email: 'noone@example.com', password: 'sekret27')
Donor.create(user_id: 1, org_name: 'Anonymous', street_address: '123 Main St.', city: 'Who-ville', state: 'Speck', zip: '14303-327', contact_name: 'Mayor', phone: '+12-34-56-78-90')
sleep 0.5
Donation.create(donor_id:1, address: '100 2nd Ave N #150, St Petersburg, FL 33701', instructions: 'bring it')
sleep 0.5

User.create(name: 'Michael', email: 'michael@example.com', password: 'reed1234')
Donor.create(user_id: 2, org_name: 'Michael and Carly')
Transporter.create(user_id: 2, name: 'Michael Reed', cell_phone: '+17274235459', open: 0, close: 24)
sleep 0.5

User.create(name: 'Kristen', email: 'kristen@example.com', password: 'swan1234')
# Receiver.create(user_id: 3, org_name: 'Swan Services', street_address: '456 7th St.', city: 'Townsville', state: 'Tokyo', zip: '100-0001-1', contact_name: 'Yuuko Takanashi', phone: '012-3456-7890', open: 6, close: 22, delivery_instructions: 'Make inside package. Send for Japan. Thanking to your.')
sleep 0.5

User.create(name: 'St. Vincent', email: 'stvin@example.com', password: 'depaul12')
Receiver.create(user_id: 4, org_name: 'St Vincent De Paul Society', street_address: '384 15th St N, St Petersburg, FL 33705', contact_name: 'Bishop Pastor', phone: '(727)555-1212', open: 6, close: 22, delivery_instructions: 'Entrance faces North underneath the overpass from 15th St. Pull in, park, come up the ramp and introduce yourself first, please.')
sleep 0.5

User.create(name: 'Womans Residence', email: 'womans@example.com', password: 'residence')
Receiver.create(user_id: 5, org_name: 'Womans Residence', street_address: '814 4th Ave N, St Petersburg, FL 33701', contact_name: 'Caring Lady', phone: '(727)555-1212', open:17, close:22, delivery_instructions: 'Bring all donations around back. Knock 3 times, 2 times, 3 times, and say the password: Mellon. Someone will open the door slowly and greet you with: Welcome #wastenot...')
sleep 0.5

User.create(name: 'Alpha House', email: 'alpha@example.com', password: 'house123')
Receiver.create(user_id: 6, org_name: 'Alpha House of Pinellas County, Inc.', street_address: '701 5th Ave N, St Petersburg, FL 33701', contact_name: 'Alpha Owner', phone: '(727)555-1212', open:6, close:22, delivery_instructions: 'Pull up to the front of the building and in Marco-Polo fashion yell out: BETA! When you hear the response: ALPHA!, someone will be down to see you in a moment.')
