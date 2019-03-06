class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params["conversation_id"])
    stream_for conversation

    user1 = false
    user2 = false


    if conversation.user_id
      user1 = User.find(conversation.user_id)
    end

    if conversation.other_user_id
      user2 = User.find(conversation.other_user_id)
    end

    if user1 && user2
      connection = Connection.create(user_id: conversation.user_id, other_user_id: conversation.other_user_id)
      send_info(conversation, user1, user2, connection)
    end

    # ConversationsChannel.broadcast_to(@conversation, {user1Location: "US", user2Location: "AU",
    #                                                   user1Name: "BOB", user2Name: "STEVE",
    #                                                   send_id: "location"})
  end

  def send_info(conversation, user1, user2, connection )
    ConversationsChannel.broadcast_to(conversation, {user1Location: user1.location, user2Location: user2.location,
                                                      user1Name: user1.name, user2Name: user2.name,
                                                      send_id: "location", connectionId: connection.id})
  end

  def unsubscribed

    @conversation = Conversation.find(params["conversation_id"])
    if @conversation.user_id == nil or @conversation.other_user_id == nil
      @conversation.destroy
    else
      ConversationsChannel.broadcast_to(@conversation, {send_id: "reopen"})
    end
  end
end
