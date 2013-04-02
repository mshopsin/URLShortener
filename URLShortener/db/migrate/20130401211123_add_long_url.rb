class AddLongUrl < ActiveRecord::Migration
	def change
		create_table :long_urls do |t|
			t.string :long

			t.timestamp
		end
	end
end
