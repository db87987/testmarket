module Spree
  module Admin
    class PricelistController < Spree::Admin::BaseController
      def upload
      end

      def load
        @errors = PriceLoader.new(params[:pricelist]).load_price
      end
    end
  end
end
