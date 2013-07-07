class AddCreatedbyToChatroom < ActiveRecord::Migration
  def change
    add_column :chatrooms, :created_by, :integer
  end
end
