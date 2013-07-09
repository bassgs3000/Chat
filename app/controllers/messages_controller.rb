class MessagesController < ApplicationController
  def index
    @room = Chatroom.find_by_identifier(session[:chat_identifier])
    @messages = Message.find_all_by_identifier(session[:chat_identifier])
    @msg = Message.new #For the form partial.
    @private = @room.private?
    @owner = User.find_by_id(@room.created_by)
    @members = @room.users

    
    if session[:chat_identifier].nil?
      redirect_to lobby_path
    else
      respond_to do |format|
        format.html
        format.json { render json: @messages }
      end
    end
  end

  def create
    @message = Message.new(params[:message].merge(username: current_user.username, identifier: session[:chat_identifier]))
    respond_to do |format|
      if @message.save
        format.js
        format.html { redirect_to messages_path }
      else
        format.js
        format.html { redirect_to messages_path }
      end
    end
  end

  def invite
    @user = User.find_by_username(params[:invite])
    @room = Chatroom.find_by_identifier(session[:chat_identifier])
    @owner = User.find_by_id(@room.created_by)
    @members = @room.users
    if @user
      @member = ChatroomMember.new(user_id: @user.id, chatroom_id: @room.id)
      respond_to do |format|
        if @member.save
          format.js
          format.html { render partial: '/messages/members', layout: false }
          format.json { redirect_to messages_path }
        else
          format.js
          format.html { render partial: '/messages/members', layout: false }
          format.json { redirect_to messages_path }
        end
      end      
    else
      respond_to do |format|
        format.js
        format.html { render partial: '/messages/members', layout: false }
        format.json { render nothing: true }
      end
    end
  end
end
