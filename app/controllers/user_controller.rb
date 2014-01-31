class UserController < ApplicationController

	def user_home
		@user_to_render = User.find(params[:id])
	end

	def populate_friends
		current_user.facebook.get_connections("me", "friends?fields=id,name,picture.type(normal)").each { |friend|
			individual_friend = FriendList.new
			individual_friend.first_name = friend['name']
			individual_friend.facebook_id = friend['id']
			individual_friend.profile_pic_url = friend['picture']['data']['url']
			individual_friend.user = current_user
			individual_friend.save!
		}
	end

	def oauth_create
	  omniauth = request.env["omniauth.auth"]

	  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	  if authentication
	    flash[:notice] = "Signed in successfully."
	    #render :text => request.env["omniauth.auth"].to_yaml
	    sign_in_and_redirect(:user, authentication.user)
	  elsif current_user
	    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'], :profile_pic_url_from_provider => omniauth['info']['image'])
	    flash[:notice] = "Authentication successful."
	    
	    render :text => request.env["omniauth.auth"].to_yaml
	  else
	    user = User.new

		user.apply_omniauth(omniauth)

	    user.save(:validate => false)
		#flash[:notice] = "Signed in successfully."
		sign_in_and_redirect(:user, user)

		puts '********************************'
		puts omniauth['credentials']
	    
	    render :text => request.env["omniauth.auth"].to_yaml
		
	  end
	end

end