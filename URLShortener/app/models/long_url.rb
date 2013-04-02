class LongUrl < ActiveRecord::Base
	attr_accessible :long
	has_many :short_urls

	def self.new_url(url)
		Long_url.create!(
		:long => url
		)
	end


end