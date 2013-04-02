class User < ActiveRecord::Base
	attr_accessible :username, :email
	has_many :visits
	has_many :short_urls, :through => :visits

	has_many :short_urls

	def take_url(url)
		 ShortUrl.build_short(url,self)
	end

	# def get_map
	# 	short_urls = ShortUrl.where(:user => self)
	# 	pairs = {}
	# 	short_urls.each do |short_url|
	# 		pairs[short_url.short] = long_url.where(:long_id => short_url.long_url_id)
	# 	end
	# end

	def visit_url(url)
		Visit.visit_url(self, url)
	end

	def get_url_id(url)
		self.short_urls.where(:short => url)[0].id
	end

	def get_urls
		self.short_urls.map do |short_link|
			 ele = LongUrl.where(:id => short_link.id)
		end.flatten.map do |link|
			link.long
		end
	end

end