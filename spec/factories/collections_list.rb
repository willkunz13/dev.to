FactoryBot.define do
  factory :collection_list do
    user
    name { generate :name }
  end
end
