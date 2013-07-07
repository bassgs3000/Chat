class MessagesController < ApplicationController
  def index
    

    @messages = Message.find_all_by_identifier(session[:chat_identifier])
    @msg = Message.new #For the form partial.
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
end
