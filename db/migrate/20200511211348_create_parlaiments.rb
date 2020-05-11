class CreateParlaiments < ActiveRecord::Migration[5.2]
  def change
    create_table :parlaiments do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end
end
