class AddStarredToItems < ActiveRecord::Migration
  def change
    add_column :items, :starred, :boolean, :default => false
  end
end
