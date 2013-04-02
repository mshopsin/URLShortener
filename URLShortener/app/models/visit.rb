class Visit < ActiveRecord::Base
	attr_accessible :user_id, :short_url_id
	belongs_to :user
	belongs_to :short_url

	def total_visits(short_u)
		self.count(:short_url_id => short_u.id)
	end

	def unique_visits(short_u)
		self.count(:short_url_id => short_u.id, :distinct => true)
	end



	def total_visits_last_10min(short_u)
		self.count(:short_url_id => short_u.id,
		           :created_at => (Time.now - 10.minutes))
	end

	def self.visit_url(user, url)
		Visit.create!(:user_id => user.id,
		              :short_url_id => user.get_url_id(url) )
	end

end