class AddUserIdToRedirects < ActiveRecord::Migration
  def change
  	add_column :redirects, :user_id, :integer
    add_index :redirects, :user_id
  end
end
