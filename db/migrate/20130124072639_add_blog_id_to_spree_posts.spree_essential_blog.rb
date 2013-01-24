# This migration comes from spree_essential_blog (originally 20120308121110)
class AddBlogIdToSpreePosts < ActiveRecord::Migration
  def self.up
    add_column :spree_posts, :blog_id, :integer
  end

  def self.down
    remove_column :spree_posts, :blog_id
  end
end
