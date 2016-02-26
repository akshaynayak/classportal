class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if params[:search].present?
      if params[:search].downcase=='active'
        @courses= Course.where('is_active = ?', true)
        return @courses
      end
    end
    if params[:search].present?
      if params[:search].downcase=='inactive'
        @courses= Course.where('is_active = ?', false)
        return @courses
      end
    end

    @courses = Course.all
    @a = Course.search(params[:search]) if params[:search].present?

    @instructors = User.search(params[:search]) if params[:search].present?

    if @instructors
      @instructors.each do |x|
      @b=x.courses
      end
    end
    if @a
      @courses=@a
      if @b
        @courses=@courses+@b
      end
    elsif @b
        @courses=@b
    end

    #@instructors=User.where(:is_admin=>false, :is_instructor=>true)
    #@instructors.
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course added. Warning no Instructor assigned. Go to the manage user history tab and add instructor'  }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def manage_course_users
    @course=params[:course]
    @course_name=Course.find(@course).course_number
    @instructors_courses=UserCourse.where(:course_id => @course, :is_teaching => true)
    @student_courses=UserCourse.where(:course_id => @course, :is_teaching => false)

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_number, :title, :description, :start_date, :end_date, :is_active, :notifications, :deadlines)
    end
end
