# This migration comes from synergy (originally 20090827180351)
class AddSecondnameToAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :secondname, :string
  end
end
