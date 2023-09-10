class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.boolean :published, :default => false
      
      t.timestamps
    end
  end
end
