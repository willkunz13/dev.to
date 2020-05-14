class CollectionsListController < ApplicationController
  before_action :authenticate_user!

  def index
    @collection_list = CollectionList.where(user: current_user)
  end

  def create
    # require 'pry'; binding.pry
  end
end
