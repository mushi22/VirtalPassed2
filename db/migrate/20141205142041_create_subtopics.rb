class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :name
      t.string :description
	  

      t.timestamps
    end
  end
end
