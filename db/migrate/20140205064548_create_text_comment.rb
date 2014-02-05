class CreateTextComment < ActiveRecord::Migration
  def up
  		create_table :text_comments do |t|

		# User who creates the comment
		t.belongs_to :comment
		t.string :comment_text

      t.timestamps
    end
  end

  def down
  end
end