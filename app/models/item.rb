class Item < ActiveRecord::Base
  attr_accessible :description, :feed_id, :link, :title
  belongs_to :feed
end
