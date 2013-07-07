class AddFeedsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :feeds_count, :integer
  end
end
