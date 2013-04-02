class AddShortUrl < ActiveRecord::Migration
	def change
		create_table :short_urls do |t|
			t.string :short
			t.integer :user_id #for creator
			t.integer :long_url_id

			t.timestamp
		end
	end
end
