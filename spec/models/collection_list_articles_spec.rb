require "rails_helper"

RSpec.describe CollectionListArticle, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:collection_list) }
    it { is_expected.to belong_to(:article) }
  end
end
