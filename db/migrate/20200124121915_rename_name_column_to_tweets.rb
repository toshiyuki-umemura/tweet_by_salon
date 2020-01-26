class RenameNameColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :name, :title
  end
end
