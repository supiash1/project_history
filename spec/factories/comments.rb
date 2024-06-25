FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    project
  end
end
