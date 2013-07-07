class AddReadToItems < ActiveRecord::Migration
  def change
    add_column :items, :read, :boolean, :default => 0
  end
end
