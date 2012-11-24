class RenameVideoContent < ActiveRecord::Migration
  def up

  	rename_column :video_contents, :video_link, :video_embed_code

  end

  def down
  end
end
