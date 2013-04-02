class RenameColInVisit < ActiveRecord::Migration
  def change
		rename_column :visits, :shorturl_id, :short_url_id
  end
end
