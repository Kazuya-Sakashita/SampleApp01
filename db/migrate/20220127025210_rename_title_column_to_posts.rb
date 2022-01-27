class RenameTitleColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :category
  end
end
