class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.text :description
      t.integer :feed_id

      t.timestamps
    end
  end
end
