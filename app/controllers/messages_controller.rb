class MessagesController < ApplicationController
  def create
    message = Message.new(conversation_id: params["conversation_id"], content: params["content"], user_id: params["user_id"])
    conversation = Conversation.find(params["conversation_id"])
    if message.save
      ConversationsChannel.broadcast_to(conversation, {message: message})
    end

  end
end
