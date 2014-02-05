class DashboardController <ApplicationController

  def home
  end

  def user_work_out_summary
    @user_to_render = User.find(params[:user_id])
  end

end
