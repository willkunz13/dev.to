class CompleteCollectionList
  attr_reader :data
  def initialize(collectionlists)
    @data = sorter
  end
  def sorter
    collectionlists.map do |collection|
      collection = CompleteCollection.new(collection)
    end
  end
end
