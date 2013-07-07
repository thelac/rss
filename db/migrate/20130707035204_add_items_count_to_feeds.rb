class AddItemsCountToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :items_count, :integer
  end
end
