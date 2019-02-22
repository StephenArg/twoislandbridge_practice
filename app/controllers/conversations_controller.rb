class ConversationsController < ApplicationController

  def find_open_room

    open_room = Conversation.find_by(status: 'open')
    #.where('user_id != ? AND other_user_id != ?', params["user"]["id"], params["user"]["id"] )

    if open_room == nil
      # create new Conversation with user inside it
      new_convo = Conversation.create(user_id: params["user"]["id"], status: "open")
      render json: {conversation_id: new_convo.id}
    else
      # add user to open user in room, change status
      if open_room.user_id == nil
        open_room.update(user_id: params["user"]["id"], status: "closed")
      else
        open_room.update(other_user_id: params["user"]["id"], status: "closed")
      end
      render json: {conversation_id: open_room.id}
      # ActionCable.server.broadcast_to open_room
    end

  end

end
