FactoryBot.define do
  factory :post do
    caption { Faker::Lorem.sentence(word_count: 8) }
    image { nil }
    association :user

    trait :invalid_attributes do
      caption { nil }
      image { nil }
      association :user
    end

    trait :new_attributes do
      caption { Faker::Lorem.sentence(word_count: 10) }
      image { nil }
      association :user
    end

    factory :post_with_comments do
      transient do
        comments_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
        post.reload
      end
    end

    factory :post_with_likes do
      transient do
        likes_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.likes_count, post: post)
        post.reload
      end
    end
  end
end
