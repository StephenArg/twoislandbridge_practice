# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create(name:"Bob")
joe = User.create(name:"Joe")
steve = User.create(name:"Steve")

conversation = Connection.create(user_id: bob.id, other_user_id: joe.id)
conversation2= Connection.create(user_id: steve.id, other_user_id: bob.id)
conversation3 = Connection.create(user_id: joe.id, other_user_id: bob.id)

message1 = Message.create(user_id: bob.id, content: "Yo", connection_id: conversation.id)
message2 = Message.create(user_id: joe.id, content: "Hey", connection_id: conversation.id)