class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new #For the form partial.
    
    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.new(params[:message].merge(username: current_user.username))

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path }
      else
        format.html { redirect_to messages_path, notice: "Error submitting message" }
      end
    end
  end
end
