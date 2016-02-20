

class SessionsController < ApplicationController
  def new

  end

  def create
    @user = Admin.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect_to '/admin_home_page'
    elsif @user
      flash.now[:danger] ='Invalid email/password combination'
      render 'new'
      #redirect_to '/login'
    else
      @user=Instructor.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        redirect_to '/'
      elsif @user
        redirect_to '/login'
      else
        @user=Student.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          session[:user_email] = @user.email
          redirect_to '/'
        else
          flash.now[:danger] ='Invalid email/password combination'
          redirect_to '/login'

        end
      end
    end
  end

  def destroy
    session[:user_id]=nil
    session[:user_email]=nil
    redirect_to '/'
  end
end




