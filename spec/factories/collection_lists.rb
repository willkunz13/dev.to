FactoryBot.define do
  factory :collection_list do
    user
  end

  trait :with_articles do
    after(:create) do |collection_list|
      create_list(:article, 3, user: collection_list.user)
    end
  end
end
