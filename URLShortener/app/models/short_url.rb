require 'SecureRandom'
#require 'debugger'
class ShortUrl < ActiveRecord::Base
	[ :user_id,
		:long_url_id,
		:short ].each { |field| attr_accessible field }

	has_many :visits
	has_many :users, :through => :visits

	belongs_to :long_url
	belongs_to :user

  validate :cant_submit_more_than_five


	def self.build_short(long_url,user)

		ShortUrl.create!(
		:short => get_secure,
		:long_url_id => get_long_url(long_url).id,
		:user_id => user.id
		)



		self
	end

	def self.get_secure
		test = SecureRandom.urlsafe_base64(3)
		until self.where(:short => test).count == 0
			test = SecureRandom.urlsafe_base64(3)
		end

		test
	end

	def self.get_long_url(url)
		LongUrl.where(:long => url)[0] || LongUrl.new_url(url)
	end

	def self.get_short_id(url)
		self.where(:short => url)[0]
	end

	def self.get_short_ids(url)
		joins(:long_url).map { |ele| ele.short }
	end

  def cant_submit_more_than_five

    if ShortUrl.where(:user_id=>user_id, :created_at => ((Time.now-600)..Time.now)).count > 5
      errors[:more_than_five] << "You can't submit more than five links within the last minute."
    end

  end


end