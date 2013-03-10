# coding: utf-8

require 'roo'

class PriceLoader
  def initialize file, filename
    @file, @filename = file, filename
    @errors = Set.new
  end

  def load_price
    skip = 1
    sheet_from_file.rows.map do |row|
      puts skip
      puts row[1]
      process_row row unless skip > 0
      skip = skip - 1
    end
    @errors
  end

  def sheet_from_file
      extension = @filename.original_filename.split('.').last
      if extension == 'xlsx'
        XLSheet.new Excelx.new @file.path
      elsif extension == 'xls'
        XLSheet.new Excel.new @file.path
      elsif extension == 'csv'
        CSVSheet.new File.new(@file.path).read #.force_encoding Encoding::UTF_8
      else
      raise "Unknown file type"
    end
  end

  def process_row row
    sku = row[1]
    name = row[2].force_encoding Encoding::UTF_8
    short_desc = row[3].force_encoding Encoding::UTF_8
    desc = row[4].force_encoding Encoding::UTF_8
    price = row[5]
    quantity = row[6]
    brand = row[7].force_encoding Encoding::UTF_8
    taxon1 = row[8].force_encoding Encoding::UTF_8
    taxon2 = row[9].force_encoding Encoding::UTF_8
    instruction = row[10]
    load_product sku, name, short_desc, desc, price, quantity, brand, taxon1, taxon2, instruction
  end

  def load_product sku, name, short_desc, desc, price, quantity, brand, taxon1, taxon2, instruction
    puts "loading prod: #{name}"
    variant = Spree::Variant.where(sku: sku).first
    product = variant.nil? ? Spree::Product.new(sku: sku) : variant.product
    
    product.name = name
    product.permalink = sku
    product.meta_description = short_desc
    product.description = desc
    product.price = price.to_f
    product.available_on ||= Time.now
    product.count_on_hand = quantity

    add_taxon brand unless brand.blank?
    add_taxon taxon1 unless taxon1.blank?
    add_taxon taxon2 unless taxon2.blank?

    if product.images.blank?
      inst = Spree::Image.new
      inst.attachment_file_name = instruction
      product.images << inst
    end

    product.save
    end
  end

  def add_taxon product, taxon_name
    taxon = Spree::Taxon.where(name: taxon_name).first
    @errors << "Не найден таксон #{taxon_name}" if taxon.nil?
    product.taxons << taxon unless taxon.nil? or product.taxons.include?(taxon)
  end
end

class Sheet
  def initialize sheet
    @sheet = sheet
  end
end

class XLSheet < Sheet
  COLUMNS = ('A'..'Z').to_a.freeze

  def rows
    Enumerator.new do |row|
      @sheet.last_row.times do |row_number|
        row << Row.new(@sheet, row_number)
      end
    end
  end

  class Row
    def initialize sheet, row_number
      @sheet, @row_number = sheet, row_number
    end

    def [] column_number
      @sheet.cell @row_number, COLUMNS[column_number]
    end
  end
end

class CSVSheet < Sheet
  def rows
    CSV.parse(@sheet)
  end
end
