class Attend < ApplicationRecord
  # the user that attended on event
  belongs_to :attendee, foreign_key: :attendee_id, class_name: 'User'

  # event
  belongs_to :attended_event, foreign_key: :event_id, class_name: 'Event'
end
