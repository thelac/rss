class Dashboard < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
end
