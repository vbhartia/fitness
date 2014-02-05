class CreateCommentOnWorkouts < ActiveRecord::Migration
  def up
	create_table :comments do |t|

		# User who creates the comment
		t.belongs_to :user
		t.belongs_to :workout
		t.string :comment_type

      t.timestamps
    end

  end

  def down
  end
end
