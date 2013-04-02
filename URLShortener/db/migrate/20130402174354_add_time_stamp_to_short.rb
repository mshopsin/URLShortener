class AddTimeStampToShort < ActiveRecord::Migration
  def change
		change_table :short_urls do |t|
			t.timestamp
		end
  end
end
