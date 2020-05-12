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
end
