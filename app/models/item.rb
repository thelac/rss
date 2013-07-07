class Item < ActiveRecord::Base
  attr_accessible :description, :feed_id, :link, :title, :published
  belongs_to :feed, inverse_of: :items
end
