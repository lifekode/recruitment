FactoryBot.define do
  factory :developer, class: Developer do
    name        { Faker::Name.initials(8)  }
    email       { Faker::Internet.email }
    password    { Faker::Internet.password(8) }
  end

  factory :invalid_developer, parent: :developer do
  email nil
end
end
