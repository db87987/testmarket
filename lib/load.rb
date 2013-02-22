# coding: utf-8
require 'roo'
FILE = 'price.xls'

class PriceLoader
  def initialize filename
    @filename = filename
  end

  def load_price
    skip = 3
    sheet_from_file.rows.map do |row|
      puts skip
      puts row[1]
      process_row row unless skip > 0
      skip = skip - 1
    end
  end

  def sheet_from_file
    extension = @filename.split('.').last
    if extension == 'xlsx'
      XLSheet.new Excelx.new @filename
    elsif extension == 'xls'
      XLSheet.new Excel.new @filename
    elsif extension == 'csv'
      CSVSheet.new File.new(@filename).read #.force_encoding Encoding::UTF_8
    else
      raise "Unknown file type"
    end
  end

  def process_row row
    sku = row[0]
    name = row[1].force_encoding Encoding::UTF_8
    price = row[2]
    quantity = row[3]
    next_taxon name if sku.blank?
    load_product sku, name, price, quantity unless sku.blank?
  end

  def load_product sku, name, price, quantity
    puts "loading prod: #{name}"
    variant = Spree::Variant.where(sku: sku).first
    product = variant.nil? ? Spree::Product.new(sku: sku) : variant.product
    product.name = name
    product.taxons << @current_taxon unless product.taxons.include?(@current_taxon)
    product.price = price.to_f
    product.available_on ||= Time.now
    product.count_on_hand = fix_quantity(quantity)
    product.save
  end

  def fix_quantity quantity
    return 6 if quantity == '> 5'
    [0, quantity.to_i].max
  end

  def next_taxon name
    puts "next taxon: #{name}"
    @current_taxon = Spree::Taxon.where(taxonomy_id: category_taxonomy.id, name: name).first_or_create
  end

  def category_taxonomy
    @category ||= Spree::Taxonomy.where(name: 'Категории').first_or_create
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

PriceLoader.new(FILE).load_price