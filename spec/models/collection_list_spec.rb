require "rails_helper"

RSpec.describe CollectionList, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:collection_list_articles) }
    it { is_expected.to have_many(:articles).through(:collection_list_articles) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
