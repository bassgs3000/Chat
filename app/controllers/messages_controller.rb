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
    @message = Message.create!(params[:message].merge(username: current_user.username))
    PrivatePub.publish_to("/message/new", message: @message)
  end
end
