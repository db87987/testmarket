class AddShortDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :short_description, :string
  end
end
