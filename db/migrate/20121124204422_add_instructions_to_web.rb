class AddInstructionsToWeb < ActiveRecord::Migration
  def change
  	add_column :website_contents, :instructions, :string
  end
end
