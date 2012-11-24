class AddInstructionsToVideo < ActiveRecord::Migration
  def change
  	add_column :video_contents, :instructions, :string
  end
end
