PATH="/var/www/home/hosting_dczvepsrf/projects/allmusicmarket/shared/system/images_without"
include Spree

Product.all.each do |product|
  ["", "-1", "-2", "-3", "-4", "-5"].each do |postfix|
    name = "#{product.sku}#{postfix}.jpg"
    path = File.join PATH, name
    if File.exists?(path) and product.images.select {|image| image.attachment_file_name == name }.empty?
      image = Image.new
      File.open(path) do |file|
        image.attachment = file
        image.save
      end

      product.images << image
      product.save
    end
  end
end
