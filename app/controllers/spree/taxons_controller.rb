# coding: utf-8

module Spree
  class TaxonsController < BaseController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/products'

    respond_to :html

    def show
      @taxon = Taxon.find_by_permalink!(params[:id])
      return unless @taxon

      @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id))
      @products = @searcher.retrieve_products
      
      @taxanomy = Spree::Taxonomy.find_by_name("Бренды")
      first = Spree::Taxon.where(:name => 'Бренды').first
      brands = Spree::Taxon.where(:taxonomy_id => @taxanomy.id)
      @brands = brands.where('id != ?', first.id)
      

      respond_with(@taxon)
    end

    private
      def accurate_title
        @taxon ? @taxon.name : super
      end
  end
end
