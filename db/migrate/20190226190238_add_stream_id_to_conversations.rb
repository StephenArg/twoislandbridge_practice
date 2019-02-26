class AddStreamIdToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :videoID, :string
  end
end
