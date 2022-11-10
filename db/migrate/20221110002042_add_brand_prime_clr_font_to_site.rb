class AddBrandPrimeClrFontToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :brand_prime_clr_font, :string
  end
end
