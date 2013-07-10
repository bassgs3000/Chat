class ChatroomMember < ActiveRecord::Base
  attr_accessible :chatroom_id, :user_id, :private
  belongs_to :user
  belongs_to :chatroom
end
