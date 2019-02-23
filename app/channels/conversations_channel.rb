class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params["conversation_id"])
    stream_for conversation
  end

  def unsubscribed

    @conversation = Conversation.find(params["conversation_id"])
    if @conversation.user_id == nil and @conversation.other_user_id == nil
      @conversation.destroy
    else
      ConversationsChannel.broadcast_to(@conversation, {send_id: true})
    end
  end
end
