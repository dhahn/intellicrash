class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
    	t.float :rating, default: 1500
    	t.float :games_played, default: 0
    	t.boolean :pro, default: false
    	t.string :img_name
      t.timestamps
    end
  end
end
