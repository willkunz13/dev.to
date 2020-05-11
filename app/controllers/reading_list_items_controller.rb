class ReadingListItemsController < ApplicationController
  # Retrieves a reading list and adds search keys to algolia
  def index
    @reading_list_items_index = true
    set_view
    generate_algolia_search_key
  end

  # update action looks for a "reaction" then checks that id vs signed in id
  # not signed in? Redirect unauthorized
  # otherwise change the status to archived or valid if the status is archived or not
  # Then sends a 200 response
  def update
    @reaction = Reaction.find(params[:id])
    not_authorized if @reaction.user_id != session_current_user_id

    @reaction.status = params[:current_status] == "archived" ? "valid" : "archived"
    @reaction.save
    head :ok
  end

  private

  def generate_algolia_search_key
    params = { filters: "viewable_by:#{session_current_user_id}" }
    @secured_algolia_key = Algolia.generate_secured_api_key(
      ApplicationConfig["ALGOLIASEARCH_SEARCH_ONLY_KEY"], params
    )
  end

  def set_view
    @view = if params[:view] == "archive"
              "archived"
            else
              "valid"
            end
  end
end
