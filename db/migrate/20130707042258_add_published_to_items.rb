class AddPublishedToItems < ActiveRecord::Migration
  def change
    add_column :items, :published, :string
  end
end
