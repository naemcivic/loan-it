# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Device.delete_all

user= User.new
user.email = 'test@example.com'
user.password = 'password'
user.password_confirmation = 'password'
user.save!

@device1 = Device.create(name:'iPad #1', id_number: '1')

@device2 = Device.create(name:'iPad #2', id_number: '2')

#@device3 = Device.create(name:'iPad #3', id_number: '3')

@user.devices << @device1