class ChangesToSearches < ActiveRecord::Migration[7.0]
  def change
    rename_column :searches, :scandoc, :scamdoc_score
    remove_column :searches, :website_name
    remove_column :searches, :website_url
    add_reference :searches, :website, foreign_key: true
  end
end
