class CreateMemberships < ActiveRecord::Migration
  def up
	create_table :memberships do |t|
		t.belongs_to :user
		t.belongs_to :group

      t.timestamps
    end
  end

  def down
  end
end
