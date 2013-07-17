module FeedsHelper
  def allItems
    allItems = []

    current_user.feeds.each do |f|
      allItems += f.items
    end

    allItems = allItems.sort_by { |f| f.published }

    return allItems.reverse
    
  end
end
