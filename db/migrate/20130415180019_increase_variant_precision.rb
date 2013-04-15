class IncreaseVariantPrecision < ActiveRecord::Migration
  def change
    change_column :spree_variants, :price, :decimal, :precision=>10, :scale=> 2
  end
end