class SessionsController < ApplicationController
  def new
    @posts = Post.where(draft: false).order(created_at: :desc)
  end

  def create
    if Users.admin.authenticate(params[:session][:password])
      login_admin
      redirect_to admin_path

    else
      flash[:danger] = "Wrong password, try again..."
      redirect_to login_path
    end
  end

  def destroy
    logout_admin
    redirect_to root_path
  end
end
