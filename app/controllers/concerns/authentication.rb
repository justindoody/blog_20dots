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
    redirect_to login_url, notice: 'Please sign in.' unless logged_in?
  end

end
