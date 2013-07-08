class ChatroomMember < ActiveRecord::Base
  attr_accessible :chatroom_id, :user_id
  belongs_to :user
  belongs_to :chatroom
end
