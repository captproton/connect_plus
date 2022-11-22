class AddTaglineToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :tagline, :string
  end
end
