class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  helper_method :admin_user, :student_user, :instructor_user

  def admin_user
    @admin_user ||= Admin.find_by_email(session[:user_email]) if session[:user_email]
  end

  def student_user
    @student_user ||= Student.find_by_email(session[:user_email]) if session[:user_email]
  end

  def instructor_user
    @instructor_user ||= Instructor.find_by_email(session[:user_email]) if session[:user_email]
  end

  def require_admin_user
    redirect_to '/login' unless admin_user
  end

  def require_student_user
    redirect_to '/login' unless student_user
  end

  def require_instructor_user
    redirect_to '/login' unless instructor_user
  end

end
