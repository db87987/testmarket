class AddHomeToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :home, :boolean
  end
end
