FactoryBot.define do
  factory :role do
    sequence(:role) do |n|
      role = %w[Admin Moderator Ordinary]
      role[n % role.length]
    end

    factory :role_with_user_roles do
      transient do
        user_roles_count { Faker::Number.number(digits: 1) }
      end

      after(:create) do |role, evaluator|
        create_list(:user_role, evaluator.user_roles_count, role: role)
        role.reload
      end
    end
  end
end
