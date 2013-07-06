class Chatroom < ActiveRecord::Base
  attr_accessible :identifier, :name, :private
end
