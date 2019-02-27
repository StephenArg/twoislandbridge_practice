class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    @conversation = Conversation.find(params["conversation_id"])
    stream_for @conversation

    @user1 = User.find(@conversation.user_id)
    @user2 = User.find(@conversation.other_user_id)
    ConversationsChannel.broadcast_to(@conversation, {user1Location: @user1.location, user2Location: @user2.location,
                                                      user1Name: @user1.name, user2Name: @user2.name, location: "locations",
                                                      send_id: "location"})
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
