require "rails_helper"

RSpec.describe "ReadingListItems", type: :request do
  let(:user) { create(:user) }
  let(:separate_user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:reaction) { create(:reaction, reactable: article, user_id: user.id) }
  let(:unauthorized_reaction) { create(:reaction, reactable: article, user_id: separate_user.id) }


  describe "GET reading list" do
 
	  before do
  	  sign_in user
 		end 

	  it "returns reading list page" do
     	 get "/readinglist"
    	 expect(response.body).to include("Reading List")
  	end
  end

  describe "PUT reading_list_items/:id" do
		
  	before do
   	 sign_in user
  	end

    it "returns archives item if no param" do
      put "/reading_list_items/#{reaction.id}"
      expect(reaction.reload.status).to eq("archived")
    end

    it "unarchives an item if current_status is passed as archived" do
      put "/reading_list_items/#{reaction.id}", params: { current_status: "archived" }
      expect(reaction.reload.status).to eq("valid")
    end

    it "raises NotAuthorizedError if current_user is not the reaction user" do
      expect { put "/reading_list_items/#{unauthorized_reaction.id}" }.to raise_error Pundit::NotAuthorizedError
    end
  end

	describe "sad path catching" do
		let(:article2) { create(:article, user_id: separate_user.id) }
  	let(:reaction2) { create(:reaction, reactable: article2, user_id: user.id) }
		
		before do
			sign_in user
		end

		it "Removing user removes it from the reading list without breaking" do
			article2.save
			put "/reading_list_items/#{reaction2.id}"
			expect(Reaction.last.user_id).to eq(user.id)
			expect(Reaction.last.reactable_id).to eq(article2.id)
			User.find(user.id).destroy	
			expect(Reaction.all.size).to eq(0)
			get "/readinglist"
      expect(response.body).to include("Reading List")
		end
	end
end
