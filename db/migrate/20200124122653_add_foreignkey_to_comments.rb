class AddForeignkeyToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :tweet, null: false, foreign_key: true
  end
end
