class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  #helper_method :admin_user, :student_user, :instructor_user
  helper_method :logged_in_user
  def logged_in_user
    @user ||= User.find_by_email(session[:user_email]) if session[:user_email]
  end

  def require_logged_in
    redirect_to '/login' unless logged_in_user
  end

end

=begin
  def is_admin_role?
    if !session[:user_email]
      false
    else
      @role=User.find_by_email(session[:user_email])
      @role.is_admin
    end

  end

  def instructor_user
    @instructor_user ||= User.find_by_email(session[:user_email]) if session[:user_email] &&  is_instructor_role?
  end

  def is_instructor_role?
    @role=User.find_by_email(session[:user_email])
    @role.is_instructor
  end

  def student_user
    @student_user ||= User.find_by_email(session[:user_email]) if session[:user_email] &&  is_student_role?
  end

  def is_student_role?
    @role=User.find_by_email(session[:user_email])
    ! @role.is_instructor || @role.is_admin
  end

=begin
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


=end
