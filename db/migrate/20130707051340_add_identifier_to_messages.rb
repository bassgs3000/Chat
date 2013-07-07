class AddIdentifierToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :identifier, :string
  end
end
