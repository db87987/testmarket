# coding: utf-8

require 'roo'

class PriceLoader
  def initialize file, filename
    @file, @filename = file, filename
    @errors = Set.new
  end

  def load_price
    sheet = sheet_from_file
    (2..sheet.last_row).map do |row|
      process_row sheet, row
    end
    @errors
  end

  def sheet_from_file
    extension = @filename.original_filename.split('.').last
    if extension == 'xlsx'
      File.rename @file.path, "/tmp/price.xlsx"
      Excelx.new "/tmp/price.xlsx"
    elsif extension == 'xls'
      File.rename @file.path, "/tmp/price.xls"
      Excel.new "/tmp/price.xls"
    else
      raise "Unknown file type"
    end
  end

  def process_row sheet, row
    sku = sheet.cell(row, 2).to_i.to_s
    name = sheet.cell(row, 3)
    puts "LOADING #{name}"
    short_desc = sheet.cell(row, 4)
    desc = sheet.cell(row, 5)
    price = sheet.cell(row, 6)
    quantity = sheet.cell(row, 7)
    brand = sheet.cell(row, 8)
    taxon1 = sheet.cell(row, 9)
    taxon2 = sheet.cell(row, 10)
    instruction = sheet.cell(row, 11)
    name, short_desc, desc, brand, taxon1, taxon2, instruction = [name, short_desc, desc, brand, taxon1, taxon2, instruction].map {|v| v.force_encoding Encoding::UTF_8 unless v.nil? }
    load_product sku, name, short_desc, desc, price, quantity, brand, taxon1, taxon2, instruction
  end

  def load_product sku, name, short_desc, desc, price, quantity, brand, taxon1, taxon2, instruction
    puts "loading prod: #{name}"
    variant = Spree::Variant.where(sku: sku).first
    product = variant.nil? ? Spree::Product.new(sku: sku) : variant.product
    
    product.name = name
    product.permalink = sku
    product.short_description = short_desc
    product.description = desc
    product.price = price.to_f
    product.available_on ||= Time.now
    product.availability_status = quantity

    product.save

    add_taxon product, brand unless brand.blank?
    add_taxon product, taxon1 unless taxon1.blank?
    add_taxon product, taxon2 unless taxon2.blank?

    if product.images.blank?
      inst = Spree::Image.new
      inst.attachment_file_name = instruction
      product.images << inst
    end
  end

  def add_taxon product, taxon_name
    taxon = Spree::Taxon.where(name: taxon_name).first
    @errors << "Не найден таксон #{taxon_name}" if taxon.nil?
    product.taxons << taxon unless taxon.nil? or product.taxons.include?(taxon)
  end
end
