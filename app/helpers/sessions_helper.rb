module SessionsHelper

  def logged_in?
    true unless session[:admin].nil?
  end

  def log_in_admin
    session[:admin] = true
  end

  def confirm_admin
      redirect_to login_url, notice: "Please sign in." unless logged_in?
  end

end
