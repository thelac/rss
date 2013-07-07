class AddUserIdToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :user_id, :integer
  end
end
