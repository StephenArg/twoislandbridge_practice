class CreateStoredMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :stored_messages do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :connection, foreign_key: true

      t.timestamps
    end
  end
end
