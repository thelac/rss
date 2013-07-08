class AddReadToItems < ActiveRecord::Migration
  def change
    add_column :items, :read, :boolean, :default => false
  end
end
