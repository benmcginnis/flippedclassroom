class AddInstructionsToLesson < ActiveRecord::Migration
  def change
  	add_column :lessons, :instructions, :string
  end
end
