class LongUrl < ActiveRecord::Base
	attr_accessible :long
  validates :long, :presence => true
  validates :long, :length => { :maximum => 1024}
	has_many :short_urls

	def self.new_url(url)
		LongUrl.create!(
		:long => url
		)
	end


end