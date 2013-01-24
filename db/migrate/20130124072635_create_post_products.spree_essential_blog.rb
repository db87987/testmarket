# This migration comes from spree_essential_blog (originally 20120306185730)
class CreatePostProducts < ActiveRecord::Migration
  def self.up
    create_table :post_products do |t|
      t.references :post
      t.references :product
      t.integer    :position
    end
  end

  def self.down
    drop_table :post_products
  end
end