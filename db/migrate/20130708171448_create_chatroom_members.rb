class CreateChatroomMembers < ActiveRecord::Migration
  def change
    create_table :chatroom_members do |t|
      t.belongs_to :user
      t.belongs_to :chatroom

      t.timestamps
    end
  end
end
