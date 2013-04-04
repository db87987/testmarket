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
    
      taxon_id = @taxon.id
      brand_taxonomy_id = Spree::Taxonomy.find_by_name('Бренды')
      
      @sql_query = (<<-SQL)
      SELECT DISTINCT spree_products_taxons.taxon_id FROM spree_products_taxons WHERE spree_products_taxons.product_id IN (
      SELECT spree_products.id FROM spree_products
      INNER JOIN spree_products_taxons ON spree_products.id = spree_products_taxons.product_id
      WHERE spree_products_taxons.taxon_id = #{taxon_id})
        SQL
      
      taxon_ids = ActiveRecord::Base.connection.execute(@sql_query).to_a.map {|tp| tp['taxon_id']}
      @brands = Spree::Taxon.where(id: taxon_ids, taxonomy_id: brand_taxonomy_id).all
      
      respond_with(@taxon)
    end

    private
      def accurate_title
        @taxon ? @taxon.name : super
      end
  end
end
