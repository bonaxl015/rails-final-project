class Event < ApplicationRecord
  belongs_to :user

  has_many :attends, dependent: :destroy
end
