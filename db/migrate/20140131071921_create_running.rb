class CreateRunning < ActiveRecord::Migration
  def up
  	create_table :runnings do |t|
		t.belongs_to :workout
		t.decimal :distance
		t.decimal :time
		t.timestamps

      t.timestamps
    end
  end

  def down
  end
end
