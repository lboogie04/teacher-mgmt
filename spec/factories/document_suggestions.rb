FactoryBot.define do
  factory :document_suggestion do
    document { nil }
    user { nil }
    suggested_content { "MyText" }
    status { "MyString" }
  end
end
