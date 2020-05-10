class ReadingListItemsController < ApplicationController
  # This class essential makes up 50% of the feature we are adding.  We will need to add destroy and show methods, as well as the create method which would make more sense in this file

  def index
    @reading_list_items_index = true
    set_view
    generate_algolia_search_key
  end

  # This passes a boolean true to view, as well as sending it a generated algoria key, and either archived or archived or valid string

  def update
    @reaction = Reaction.find(params[:id])
    not_authorized if @reaction.user_id != session_current_user_id

    @reaction.status = params[:current_status] == "archived" ? "valid" : "archived"
    @reaction.save
    head :ok
  end
  # This method takes in user params, checks its the valid user, switches it to archived or unarchives it, and saves

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
