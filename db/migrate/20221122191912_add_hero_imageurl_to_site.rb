class AddHeroImageurlToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :hero_image_url, :text
  end
end
