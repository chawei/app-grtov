class ChangeHiddenDatatypeInCategories < ActiveRecord::Migration
  def self.up
    change_column :categories, :hidden, :integer, :default => 0
  end

  def self.down
    change_column :categories, :hidden, :boolean
  end
end
