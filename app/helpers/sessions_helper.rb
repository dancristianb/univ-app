module SessionsHelper
  def session_link
    return link_to 'Log out', logout_path, method: :delete if logged_in?

    link_to 'Log in', login_path
  end
end
