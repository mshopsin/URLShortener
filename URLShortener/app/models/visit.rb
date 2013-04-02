class Visit < ActiveRecord::Base
	attr_accessible :user_id, :short_url_id
	belongs_to :user
	belongs_to :short_url

	def self.total_visits(short_u)
		self.where(:short_url_id =>  ShortUrl.get_short_id( short_u ) ).count
	end

	def self.unique_visits(short_u)
		#self.count(:short_url_id => ShortUrl.get_short_id( short_u ),
		#           :distinct => true)
		ShortUrl.get_short_ids(short_u).count
	end


	def self.total_visits_last_10min(short_u)
		self.where(:short_url_id => ShortUrl.get_short_id( short_u ),
		           :created_at => (Time.now - 600)..Time.now).count
	end

	def self.visit_url(user, url)
		Visit.create!(:user_id => user.id,
		              :short_url_id => user.get_url_id(url) )
	end

end