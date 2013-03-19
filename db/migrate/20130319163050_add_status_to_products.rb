class AddStatusToProducts < ActiveRecord::Migration
  def change
    add_column Spree::Product.table_name, :availability_status, :integer, :default => 0, :null => false
  end
end
