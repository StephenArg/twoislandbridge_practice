class ConversationsController < ApplicationController

  def find_open_room
    open_room = Conversation.find_by(status: 'open')
    # users can currently join their own conversations. I need to find a way to prevent that here.
    #.where('user_id != ? AND other_user_id != ?', params["user"]["id"], params["user"]["id"] )
    #.find_by("user_id != ?", params["user"]["id"]).find_by("other_user_id != ?", params["user"]["id"])

    if open_room == nil
      # create new Conversation with user inside it
      new_convo = Conversation.create(user_id: params["user"]["id"], status: "open")
      render json: {conversation_id: new_convo.id}
    else
      # add user to open user in room, change status
      if open_room.user_id == nil and open_room.other_user_id != params["user"]["id"]
        open_room.update(user_id: params["user"]["id"], status: "closed")
        render json: {conversation_id: open_room.id}
      elsif open_room.other_user_id == nil and open_room.user_id != params["user"]["id"]
        open_room.update(other_user_id: params["user"]["id"], status: "closed")
        render json: {conversation_id: open_room.id}
      else
        new_convo = Conversation.create(user_id: params["user"]["id"], status: "open")
        render json: {conversation_id: new_convo.id}
      end
      # ActionCable.server.broadcast_to open_room
    end
  end

  def reopen
    conversation = Conversation.find(params["conversation_id"])
    present_user_id = params["user_id"]
    if conversation.user_id == present_user_id
      conversation.update(other_user_id: nil, status: "open")
    else
      conversation.update(user_id: nil, status: "open")
    end
  end

end
