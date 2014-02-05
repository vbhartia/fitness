class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :authentications
  has_many :friend_lists
  has_many :workouts

  has_many :memberships
  has_many :groups, :through => :memberships

  def apply_omniauth(omniauth)
    authentications.build(
      :provider => omniauth['provider'], 
      :uid => omniauth['uid'],
      :profile_pic_url_from_provider => omniauth['info']['image'],
 	  :auth_token => omniauth['credentials']['token']).save

    self.first_name = omniauth['info']['name']
    self.user_name = omniauth['info']['nickname']
    self.profile_pic_url = omniauth['info']['image']

  end

  def full_name
    self.first_name.to_s + ' ' + self.last_name.to_s
  end


	def facebook
		@facebook ||= Koala::Facebook::API.new(self.authentications.first.auth_token)
	end

end
