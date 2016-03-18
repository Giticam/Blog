class RemoveUserReset < ActiveRecord::Migration
  def change
    remove_column :users, :reset_digest
  end
end
