FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    username { Faker::Lorem.unique.characters(number: 6) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    slug { username }

    factory :user_with_admin_role do
      after(:create) do |user|
        user.roles << create(:role, role: 'Admin')
        user.roles << create(:role, role: 'Moderator')
      end
    end

    factory :user_with_moderator_role do
      after(:create) do |user|
        user.roles << create(:role, role: 'Moderator')
      end
    end

    factory :user_with_posts do
      transient do
        posts_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
        user.reload
      end
    end

    factory :user_with_comments do
      transient do
        comments_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |user, evaluator|
        create_list(:comment, evaluator.comments_count, user: user)
        user.reload
      end
    end

    factory :user_with_likes do
      transient do
        likes_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |user, evaluator|
        create_list(:like, evaluator.likes_count, user: user)
        user.reload
      end
    end

    factory :user_with_events do
      transient do
        events_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |user, evaluator|
        create_list(:event, evaluator.events_count, user: user)
        user.reload
      end
    end

    factory :user_with_attends do
      transient do
        attends_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |user, evaluator|
        create_list(:attend, evaluator.attends_count, user: user)
        user.reload
      end
    end
  end
end
