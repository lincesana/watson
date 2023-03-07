class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.text :website_name
      t.text :website_url
      t.boolean :trustpilot_verification
      t.integer :scandoc
      t.boolean :https
      t.integer :rating

      t.timestamps
    end
  end
end
