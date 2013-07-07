class Feed < ActiveRecord::Base
  attr_accessible :description, :link, :title, :user_id
  belongs_to :user
  has_many :items

  validates :title, presence: true, length: { maximum: 40 }
  validates :link, presence: true
  validates :user_id, presence: true
  validates :description, length: { maximum: 140 }
  
end
