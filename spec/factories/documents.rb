FactoryBot.define do
  factory :document do
    name { Faker::Company.bs.titleize }
    content { Faker::Lorem.sentence }
    document_type { "md" }
    user { nil }
    slug { "fdkdjkdfkeklkdj" }
  end
end
