class CreateDownloadContents < ActiveRecord::Migration
  def change
    create_table :download_contents do |t|
      t.string :name
      t.string :download_link
      t.string :instructions
      t.integer :lesson_id

      t.timestamps
    end
  end
end
