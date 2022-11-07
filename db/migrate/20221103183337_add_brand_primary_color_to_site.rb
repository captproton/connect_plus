class AddBrandPrimaryColorToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :brand_primary_color, :string, default: "", null: false
  end
end
