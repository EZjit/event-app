class RenameColumnInEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :describing, :description
  end
end
