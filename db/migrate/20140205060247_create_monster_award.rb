class CreateMonsterAward < ActiveRecord::Migration
  def up
  		create_table :monsterawardcomments do |t|

		# User who creates the comment
		t.belongs_to :comment
		t.string :monster_graphic

      t.timestamps
    end
  end

  def down
  end
end
