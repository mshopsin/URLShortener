class AddTimeStampsShortsIi < ActiveRecord::Migration
  def change
    change_table :short_urls do |t|
      t.timestamps
    end
  end
end
