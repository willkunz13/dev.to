require "rails_helper"

RSpec.describe ParlaimentArticle, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:parlaiment) }
    it { is_expected.to belong_to(:article) }
  end
end
