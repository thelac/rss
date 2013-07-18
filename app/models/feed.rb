class Feed < ActiveRecord::Base
  attr_accessible :description, :link, :title, :user_id
  belongs_to :user, inverse_of: :feeds
  has_many :items, inverse_of: :feed, dependent: :destroy

  validates :title, presence: true, length: { maximum: 40 }
  validates :link, presence: true
  validates :user_id, presence: true
  validates :description, length: { maximum: 140 }
 
  def update
    feed = Feedzirra::Feed.fetch_and_parse(self[:link])
    most_recent = self.items.last
    counter = 0
    itemlist = []


    feed.entries.each do |item|
      begin
        break if item.title == most_recent.title
      rescue Exception => e
        debugger
      else
        itemlist += [item]
      end
    end


    itemlist.reverse_each do |item|
          self.items.create( description: item.summary,
                              title: item.title,
                              link: item.url,
                              published: item.published,
                              read: false)
          counter += 1
        end
    
    return counter
  end

  def updateAll
  	Feed.all.each do |f|
	    f.update
  	end
  end
end