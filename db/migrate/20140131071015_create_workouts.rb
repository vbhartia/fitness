class CreateWorkouts < ActiveRecord::Migration
  def up
  	create_table :workouts do |t|
    	t.belongs_to :user
		t.timestamps

      t.timestamps
    end
  end

  def down
  end
end
