class CreateCollectionLists < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_lists do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end
end
