class RemoveUserResetSend < ActiveRecord::Migration
  def change
    remove_column :users, :reset_send_at
  end
end
