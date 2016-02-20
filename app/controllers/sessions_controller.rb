

class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email])
    #@user_admin_role=User.find_by_is_admin(params[:session][:email])
    #@user_instructor_role=User.find_by_is_instructor(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      if @user.is_admin
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        session[:role]='admin'
        redirect_to '/admin_home_page'
      elsif @user.is_instructor
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        session[:role]='instructor'
        redirect_to '/instructor_home_page'
      else
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        session[:role]='student'
        redirect_to '/student_home_page'
      end
    else
       flash.now[:danger] ='Invalid email/password combination'
       redirect_to '/login'

    end
  end

  def destroy
    session[:user_id]=nil
    session[:user_email]=nil
    session[:role]=nil
    redirect_to '/'
  end
end




