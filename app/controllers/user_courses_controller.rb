class UserCoursesController < ApplicationController
  before_action :set_user_course, only: [:show, :edit, :update, :destroy]

  # GET /user_courses
  # GET /user_courses.json
  def index
    @user_courses = UserCourse.all
  end

  # GET /user_courses/1
  # GET /user_courses/1.json
  def show
  end

  # GET /user_courses/new
  def new
    @user_course = UserCourse.new
  end

  # GET /user_courses/1/edit
  def edit
  end

  # POST /user_courses
  # POST /user_courses.json
  def create
    @user_course = UserCourse.new(user_course_params)
    respond_to do |format|
      if @user_course.save
        format.html { redirect_to @user_course, notice: 'User course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_courses/1
  # PATCH/PUT /user_courses/1.json
  def update
    respond_to do |format|
      if @user_course.update(user_course_params)
        format.html { redirect_to @user_course, notice: 'User course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_courses/1
  # DELETE /user_courses/1.json
  def destroy
    @user_course.destroy
    if logged_in_user.is_admin
    respond_to do |format|
      format.html { redirect_to user_courses_url }
      format.json { head :no_content }
    end
    elsif logged_in_user.is_instructor
      respond_to do |format|
        format.html { redirect_to user_courses_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to student_home_page_url }
        format.json { head :no_content }
      end
    end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_course
      @user_course = UserCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_course_params
      params.require(:user_course).permit(:is_teaching, :is_enrolled, :has_requested_enrollment, :grade, :user_id, :course_id)
    end
end
