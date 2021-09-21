class Event < ApplicationRecord
  belongs_to :user

  has_many :attends, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :valid_start_date
  validate :valid_end_date

  def valid_start_date
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date <= Time.zone.now
  end

  def valid_end_date
    errors.add(:end_date, "can't be behind start date") if start_date.nil? || end_date.present? && end_date < start_date
  end
end
