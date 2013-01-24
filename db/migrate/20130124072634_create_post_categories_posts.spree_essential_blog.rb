# This migration comes from spree_essential_blog (originally 20120306185720)
class CreatePostCategoriesPosts < ActiveRecord::Migration
  def self.up
    create_table :post_categories_posts, :id => false, :force => true do |t|
      t.integer :post_id
      t.integer :post_category_id
    end
  end

  def self.down
    drop_table :post_categories_posts
  end
end
