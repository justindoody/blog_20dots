module SessionsHelper

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in_user
      redirect_to login_url, notice: "Please sign in." unless logged_in?
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= Users.find_by(id: user_id)
    end
  end

end
