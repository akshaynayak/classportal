class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_logged_in, only: [:admin_home_page, :list_instructors, :list_students, :student_home_page, :instructor_home_page, :show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def admin_home_page
    if logged_in_user.is_admin
      @admins=User.where(:is_admin=>true)
    else
      flash[:notice] = "not enough rights !"
      redirect_to '/login'
    end
  end

  def list_students
    @students=User.where(:is_admin=>false ,:is_instructor=>false)
  end

  def list_instructors
    @instructors=User.where(:is_admin=>false, :is_instructor=>true)
  end

  def list_user_course
    @user_courses=UserCourse.all
    @users=User.all
    @courses=Course.all
  end

  def student_home_page
    @courses=Course.all
    #@own_courses=UserCourse.where(:user_id => [:sess])
    #@own_courses=UserCourse.where(:user_id=>session[:user_id]) if session[:user_id]
    @user=User.find_by_id(session[:user_id]) if session[:user_id]
    @my_courses=@user.courses
    @my_enrolled_courses=@user.user_courses.where(:is_enrolled=>true)
    @my_requested_courses=@user.user_courses.where(:has_requested_enrollment=>true)
    @my_course_mappings=@user.user_courses

    @un_enrolled_courses=@courses-@my_courses

  end

  def enroll_student
      @course=params[:course]
      @user_course=UserCourse.new(:user_id=>session[:user_id],:course_id=>@course, :has_requested_enrollment=>true, :is_teaching=>false, :is_enrolled=> false )

      respond_to do |format|
        if @user_course.save
          format.html { redirect_to @user_course, notice: 'Enrollment request generated.' }
          format.json { render action: 'show', status: :created, location: @user_course }
        else
          format.html { render action: 'student_home_page' }
          format.json { render json: @user_course.errors, status: :unprocessable_entity }
        end
      end

  end

  def instructor_home_page
    @instructor=User.find_by_id(session[:user_id]) if session[:user_id]
    @courses_taught=@instructor.courses
    @my_course_mappings=@instructor.user_courses

  end


  def student_enrollment_requests
      @my_course=params[:course]
      @course=Course.find_by_id(@my_course)
      @instructor=User.find_by_id(session[:user_id]) if session[:user_id]
      @students_enrollment_requests=UserCourse.where(:course_id=>@course.id)

  end

  def enroll
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :is_admin, :is_instructor)
    end

    def req_params
      params.require(:course).permit(:course_id)
    end
end
