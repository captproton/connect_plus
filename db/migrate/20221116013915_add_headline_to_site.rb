class AddHeadlineToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :headline, :string
  end
end
