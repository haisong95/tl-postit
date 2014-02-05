class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception


   def current_user
    @current ||= User.find(session[:user_id]) if session[:user_id]
   end

   def logged_in?
    !!current_user
   end

   def require_user
    if !logged_in?
      flash[:error] = "Please login to do that"
      redirect_to root_path
    end
   end
end
