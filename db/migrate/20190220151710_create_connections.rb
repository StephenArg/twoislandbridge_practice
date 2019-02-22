class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :other_user_id

      t.timestamps
    end
  end
end
#
# t.references :user1, foreign_key: {to_table: :users}
# t.references :user2, foreign_key: {to_table: :users}