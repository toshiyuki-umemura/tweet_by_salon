# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string        :title, null: false
      t.string        :text, null: false
      t.text          :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
