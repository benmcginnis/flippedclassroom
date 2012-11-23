class CreateVideoContents < ActiveRecord::Migration
  def change
    create_table :video_contents do |t|
      t.string :video_link
      t.string :name
      t.integer :lesson_id

      t.timestamps
    end
  end
end
