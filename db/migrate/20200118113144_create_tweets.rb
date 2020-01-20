class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.text :image
      t.timestamps
    end
  end
end
