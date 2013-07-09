class AddPrivateToChatroomMember < ActiveRecord::Migration
  def change
    add_column :chatroom_members, :private, :boolean
  end
end
