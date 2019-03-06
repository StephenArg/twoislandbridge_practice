bob = User.create(email:"bob@bob.com",name:"Bob", password: "what1", location: "United States")
joe = User.create(email:"joe@joe.com", name:"Joe", password: "what1", location: "United States")
steve = User.create(email:"steve@steve.com", name:"Steve", password: "what1", location: "United States", image_url:"https://i.pinimg.com/originals/04/61/11/046111473580be34658a01f661a946b5.jpg")

# conversation = Connection.create(user_id: bob.id, other_user_id: joe.id)
# conversation2= Connection.create(user_id: steve.id, other_user_id: bob.id)
# conversation3 = Connection.create(user_id: joe.id, other_user_id: bob.id)

# message1 = Message.create(user_id: bob.id, content: "Yo", conversation: conversation.id)
# message2 = Message.create(user_id: joe.id, content: "Hey", conversation: conversation.id)