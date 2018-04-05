FactoryBot.define do
  factory :programming_language, class: ProgrammingLanguage do
    name { Faker::ProgrammingLanguage.name }
  end
end
