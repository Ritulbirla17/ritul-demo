class AddForeigKeyToFriendship < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :sent_by_id, :integer
    add_column :friendships, :sent_to_id, :integer
  end
end
