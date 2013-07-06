class LobbyController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @chatroom = Chatroom.new(params[:chatroom])

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to lobby_path }
      else
        format.html { redirect_to lobby_path }
      end
    end
  end
end
