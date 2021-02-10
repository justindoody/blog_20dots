class SessionsController < ApplicationController
  before_action :redirect_to_admin_if_logged_in, only: :new

  def new
    @posts = Post.where(draft: false).order(created_at: :desc)
  end

  def login
    if User.admin.authenticate(login_params[:password])
      login_admin
      redirect_to admin_posts_path

    else
      flash[:danger] = "Wrong password, try again..."
      redirect_to admin_sessions_path
    end
  end

  def logout
    logout_admin
    redirect_to root_path
  end

  private

    def login_params
      params.require(:session).permit(:password)
    end
end
