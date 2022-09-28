class CreateFriendship < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
