class Attend < ApplicationRecord
  # the user that attended on event
  belongs_to :attendee, foreign_key: :attendee_id, class_name: 'User'

  # event
  belongs_to :attended_event, foreign_key: :event_id, class_name: 'Event'

  validates :attendee_id, uniqueness: { scope: :event_id, message: 'You already been enrolled for this event' }
end
