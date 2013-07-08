class ChatroomMember < ActiveRecord::Base
  attr_accessible :chatroom_id, :user_id
  belongs_to :users
  belongs_to :chatrooms
end
