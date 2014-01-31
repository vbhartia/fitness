class CreateGroups < ActiveRecord::Migration
  def up
	  create_table :groups do |t|
		t.string :name
		t.timestamps

      t.timestamps
    end
  end

  def down
  end
end
