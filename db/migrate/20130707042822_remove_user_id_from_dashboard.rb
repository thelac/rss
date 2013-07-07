class RemoveUserIdFromDashboard < ActiveRecord::Migration
  def up
    remove_column :dashboards, :user_id
  end

  def down
    add_column :dashboards, :user_id, :integer
  end
end
