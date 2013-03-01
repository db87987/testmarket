module Spree
  module CheckoutHelper
    def checkout_progress
      states = @order.checkout_steps
      items = states.map do |state|
        text = t("order_state.#{state}").titleize

        css_classes = []
        current_index = states.index(@order.state)
        state_index = states.index(state)



        css_classes << 'one-light-color' if state_index == current_index + 1
        css_classes << 'dark-color' if state_index == current_index - 1
        css_classes << 'dark-color' if state_index == current_index - 2
        css_classes << 'two-colors' if state == @order.state
        css_classes << 'two-colors bm-first' if state_index == 0
        # It'd be nice to have separate classes but combining them with a dash helps out for IE6 which only sees the last class
        content_tag('li', text, :class => css_classes.join(' '))
      end
      content_tag('ul', raw(items.join("\n")), :class => 'basket-menu', :id => "checkout-step-#{@order.state}")
    end
  end
end
