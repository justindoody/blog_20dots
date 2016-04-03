module Authentication
  extend ActiveSupport::Concern

  def login_admin
    session[:admin] = true
  end

  def logout_admin
    session.delete(:admin)
  end

  def logged_in?
    session[:admin]
  end

  def confirm_admin
    redirect_to admin_sessions_url, notice: 'Please sign in.' unless logged_in?
  end

  def redirect_to_admin_if_logged_in
    redirect_to admin_posts_path if logged_in?
  end

end
