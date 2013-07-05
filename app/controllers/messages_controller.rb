class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @msg = Message.new #For the form partial.
    
    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.new(params[:message].merge(username: current_user.username))
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
