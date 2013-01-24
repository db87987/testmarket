# This migration comes from spree_essential_menus (originally 20120509085046)
class AddMenuImagesToMenus < ActiveRecord::Migration
  def change
    add_column :spree_menus, :menu_image_file_name,    :string
    add_column :spree_menus, :menu_image_content_type, :string
    add_column :spree_menus, :menu_image_file_size,    :integer
    add_column :spree_menus, :menu_image_updated_at,   :datetime
  end
end
