class ProductSearch < Spree::Core::Search::Base

          def get_base_scope
            base_scope = super
            base_scope = base_scope.ascend_by_master_price if @properties[:sort] == 'price'
            base_scope = base_scope.order('name ASC') if @properties[:sort] == 'name'
            
            base_scope = base_scope.where(count_on_hand: @properties[:status].to_i) if @properties[:status]
            base_scope
          end


          def prepare(params)
            super
            @properties[:sort] = params[:sort]
            @properties[:status] = params[:status]
          end       

end