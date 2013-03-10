# coding: utf-8

require 'load' 

module Spree
  module Admin
    class PricelistController < Spree::Admin::BaseController
      
      def show
      end

      def load
        @errors = PriceLoader.new(params[:pricelist]).load_price
      end      
    end
  end
end
