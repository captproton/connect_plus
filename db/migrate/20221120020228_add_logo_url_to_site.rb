class AddLogoUrlToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :logo_url, :text
  end
end
