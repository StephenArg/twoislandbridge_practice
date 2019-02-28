class Api::MessagesController < ApplicationController
  def create
    message = Message.new(conversation_id: params["conversation_id"], content: params["content"], user_id: params["user_id"])
    conversation = Conversation.find(params["conversation_id"])
    user = User.find(message.user_id)
    if message.save
      ConversationsChannel.broadcast_to(conversation, {message: message, user: user, send_id: false})
    end

  end
end
