FactoryBot.define do
  factory :event do
    name { Faker::Lorem.characters }
    description { Faker::Lorem.sentence(word_count: 8) }
    start_date { Time.zone.now.tomorrow }
    end_date { 2.hours.from_now.tomorrow }
    association :user

    trait :invalid_attributes do
      name { nil }
      description { nil }
      start_date { Time.zone.now.yesterday }
      end_date { 2.hours.ago.yesterday }
      association :user
    end

    trait :new_attributes do
      name { Faker::Lorem.characters }
      description { Faker::Lorem.sentence(word_count: 10) }
      start_date { Time.zone.now.tomorrow }
      end_date { 3.hours.from_now.tomorrow }
      association :user
    end

    factory :event_with_attendees do
      transient do
        attendees_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |event, evaluator|
        create_list(:attend, evaluator.attendees_count, event: event)
        event.reload
      end
    end
  end
end
