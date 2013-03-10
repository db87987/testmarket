require File.join Rails.root, 'lib/load.rb'

module Spree
  module Admin
    class PricelistController < Spree::Admin::BaseController
      
      def show
      end

      def load
        @errors = PriceLoader.new(params[:pricelist].tempfile, params[:pricelist]).load_price
      end      
    end
  end
end
