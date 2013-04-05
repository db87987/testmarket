class AddFileToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :file, :string
  end
end
