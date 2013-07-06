class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.string :identifier
      t.boolean :private

      t.timestamps
    end
  end
end
