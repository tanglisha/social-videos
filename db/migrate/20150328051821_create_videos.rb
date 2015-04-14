class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :external_id
      t.string :description
      t.string :link
      t.string :source
      t.string :title

      t.timestamps null: false
    end
  end
end
