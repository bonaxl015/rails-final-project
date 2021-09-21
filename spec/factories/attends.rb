FactoryBot.define do
  factory :attend do
    association :user
    association :event
  end
end
