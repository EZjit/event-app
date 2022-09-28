class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :private, :event_type
  end
end
