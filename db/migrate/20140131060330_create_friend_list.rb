class CreateFriendList < ActiveRecord::Migration
  def up
    create_table :friend_lists do |t|
    	t.belongs_to :user
		t.string :first_name
		t.string :last_name
		t.string :facebook_id
		t.string :profile_pic_url

		t.timestamps

      t.timestamps
    end
  end

  def down
  end
end
