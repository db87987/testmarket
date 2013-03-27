# coding: utf-8

class Spree::BrandsController < Spree::BaseController
  helper 'spree/products'
  
  def index 
    @taxanomy = Spree::Taxonomy.find_by_name("Бренды")
    first = Spree::Taxon.where(:taxonomy_id => @taxanomy.id).first
    brands = Spree::Taxon.where(:taxonomy_id => @taxanomy.id)
    @brands = brands.where('id != ?', first.id)
    

  end
end
