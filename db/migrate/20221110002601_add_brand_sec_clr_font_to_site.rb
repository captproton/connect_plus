class AddBrandSecClrFontToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :brand_sec_clr_font, :string
  end
end
