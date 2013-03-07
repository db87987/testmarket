# coding: utf-8


module Spree
  module Admin
    class PricelistController < Spree::Admin::BaseController
      
    require 'load' 
      
      def show
        
      end

      def load
        @errors = PriceLoader.new(params[:pricelist]).load_price
      end      
    end
  end
end
