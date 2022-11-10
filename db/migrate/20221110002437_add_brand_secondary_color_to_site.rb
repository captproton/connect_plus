class AddBrandSecondaryColorToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :brand_secondary_color, :string
  end
end
