class CompleteCollection
  attr_reader :name, :articles, :id
  def initialize(collection)
    @id = collection.id
    @name = collection.name
    @articles = collection.articles
  end
end
