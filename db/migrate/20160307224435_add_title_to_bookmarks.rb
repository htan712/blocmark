class AddTitleToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :text
  end
end
