class Item < ActiveRecord::Base
  attr_accessible :description, :feed_id, :link, :title, :published, :read, :starred
  belongs_to :feed, inverse_of: :items

	def read?
		self.read
	end

	def toggle_read
		self.read = !self.read

		## TODO: Test whether this is necessary
		## TODO: Saving every time to DB is really bad
		self.save
	end

	def starred?
		self.starred
	end

	def toggle_starred
		self.starred = !self.starred

		## TODO: Test whether this is necessary
		## TODO: Saving every time to DB is really bad
		self.save
	end

end
