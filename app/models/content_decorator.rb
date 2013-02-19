# app/models/content_decorator.rb

Spree::Content.class_eval do

def default_attachment_sizes
   { :mini => '48x48>', :medium => '720x362#' }
 end
 
end