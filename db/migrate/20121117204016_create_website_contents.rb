class CreateWebsiteContents < ActiveRecord::Migration
  def change
    create_table :website_contents do |t|
      t.string :contentlink
      t.string :name
      t.integer :lesson_id

      t.timestamps
    end
  end
end
