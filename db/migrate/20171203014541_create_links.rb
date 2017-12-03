class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :studygroup_id
      t.string :keywords

      t.timestamps
    end
  end
end
