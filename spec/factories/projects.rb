FactoryBot.define do
  factory :project do
    name { Faker::Lorem.sentence }
    status { association :status, strategy: :build }

    after(:build) do |project|
      project.comments << build(:comment, project: project)
    end
  end
end
