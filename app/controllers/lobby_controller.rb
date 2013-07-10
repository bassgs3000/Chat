class LobbyController < ApplicationController
  def index
    if user_signed_in?
      @public_chatrooms = Chatroom.where(private: false)
      @private_chatrooms = User.find(current_user.id).chatrooms.where(private: true)
    
      respond_to do |format|
        format.js
        format.html
      end
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @chatroom = Chatroom.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @chatroom = Chatroom.new(params[:chatroom].merge(created_by: current_user.id))

    respond_to do |format|
      if @chatroom.save
        ChatroomMember.create!(user_id: current_user.id, chatroom_id: @chatroom.id, private: @chatroom.private)
        format.html { redirect_to lobby_path }
      else
        format.html { redirect_to lobby_path }
      end
    end
  end

  def setroom
    session[:chat_identifier] = params[:identifier]
    respond_to do |format|
      format.json { redirect_to messages_path }
    end
  end
end
