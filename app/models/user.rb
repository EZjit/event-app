# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable

  has_many :created_events, class_name: 'Event', dependent: :destroy

  # Event attends

  has_many :attends, foreign_key: :attendee_id, class_name: 'Attend', dependent: :destroy
  has_many :attended_events, through: :attends

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def attended?(event)
    event.attendees.include?(self)
  end

  def not_attended?(event)
    event.attendees.exclude?(self)
  end
end
