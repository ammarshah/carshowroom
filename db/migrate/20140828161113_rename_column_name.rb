class RenameColumnName < ActiveRecord::Migration
  def change
  	rename_column :photos, :name, :photo
  end
end
