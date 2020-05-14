class CollectionsListController < ApplicationController
  before_action :authenticate_user!

  def index
    collection_list = CollectionList.where(user: current_user)
    @collection_list = CompleteCollectionList.new(collection_list).to_json
  end

  def create
    CollectionList.create(name: params["collections_list"]["name"], user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def update
    collection = CollectionList.find(params[:collection_id])
    article = Article.find(params[:article_id])

    collection.articles << article

    collection.save
  end
end
