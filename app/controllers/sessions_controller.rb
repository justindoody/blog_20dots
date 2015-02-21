class SessionsController < ApplicationController
  def new
    @posts = Post.where(draft: false).order(created_at: :desc)
  end

  def create
    user = Users.first()
    if user && user.authenticate(params[:session][:password])
      log_in_admin
      redirect_to admin_path
    else
      flash[:danger] = "Wrong password, try again..."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
