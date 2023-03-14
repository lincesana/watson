class CreateBookmarkCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmark_categories do |t|
      t.references :bookmark, null: false, foreign_key: true
      t.references :user_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
