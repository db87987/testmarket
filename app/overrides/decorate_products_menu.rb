Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "pricelist_admin_product_sub_tabs",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs'], #admin_product_sub_tabs[data-hook]",
                     :text => "<%= tab(:pricelist, :url => 'pricelist', :label => :pricelist) %>",
                     :disabled => false)
