class CompleteCollection
  attr_reader :name, :articles
  def initialize(collection)
    @name = collection.name
    @articles = collection.articles
  end
end
