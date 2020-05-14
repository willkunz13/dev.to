class CompleteCollectionList
  attr_reader :data
  def initialize(collectionlists)
    @data = sorter(collectionlists)
  end

  def sorter(collectionlists)
    collectionlists.map do |collection|
      CompleteCollection.new(collection)
    end
  end
end
