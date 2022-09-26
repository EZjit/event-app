class Event < ApplicationRecord
  validates :title, :description, :location, :event_date, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  has_many :attendances, foreign_key: :event_id, class_name: 'Attend'
  has_many :attendees, through: :attendances

  scope :past_events, -> { where('event_date <= ?', Time.zone.now).order(event_date: :desc) }
  scope :upcoming_events, -> { where('event_date > ?', Time.zone.now).order(event_date: :desc) }
end
