require "rails_helper"

RSpec.describe "Collection List Items", type: :request do
  let(:user) { create(:user) }
  let(:separate_user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }

  before do
    sign_in user
  end

  describe "GET collection list" do
    it "returns collection list page" do
      collection = CollectionList.new(name: "A new parliament name", user: user)
      collection.save!
      get collections_list_path
      expect(response.body).to include(collection.name)
    end
  end

  describe "POST collection list" do
    it "can create a new collection" do
      expect(CollectionList.first).to eq(nil)
      post "/collections_list", params: { collections_list: { name: "New list" } }

      expect(CollectionList.first.name).to eq("New list")
    end
  end

  describe "PATCH collection list" do
    it "can add articles to collection" do
      collection = CollectionList.new(name: "A new parliament name", user: user)
      collection.save!

      expect(collection.articles).to eq([])

      patch "/collections_list", params: {
        article_id: article.id,
        collection_id: collection.id
      }

      collection.reload
      expect(collection.articles.last).to eq(article)
    end
  end
end
