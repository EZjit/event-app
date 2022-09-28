class AddIndexToJoinTable < ActiveRecord::Migration[7.0]
  def change
    add_index :attends, %i[attendee_id event_id], unique: true
  end
end
