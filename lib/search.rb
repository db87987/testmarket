class ProductSearch < Spree::Core::Search::Base

          def get_base_scope
            base_scope = super
            base_scope = base_scope.ascend_by_master_price if @properties[:sort] == 'price'
            base_scope = base_scope.order('name ASC') if @properties[:sort] == 'name'
            base_scope = base_scope.descend_by_popularity if @properties[:sort] == 'popularity'
            base_scope = base_scope.where('spree_products.name ilike ?', "#{@properties[:brand]}%") if @properties[:brand]
            base_scope = base_scope.where(count_on_hand: @properties[:status].to_i) if @properties[:status]
            base_scope
          end


          def prepare(params)
            super
            @properties[:sort] = params[:sort]
            @properties[:brand] = params[:brand]
            @properties[:status] = params[:status]
          end       

end

