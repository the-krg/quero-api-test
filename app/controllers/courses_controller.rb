class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.filter(filter_params)

    render json: JSON.pretty_generate(@courses.as_json)
  end

  # GET /courses/1
  def show
    render json: JSON.pretty_generate(CourseSerializer.new(@course).as_json)
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private
    def filter_params
      params.permit(:name, :kind, :shift, :level, :university_name)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :kind, :level, :shift, :university_id, :campus_id)
    end
end
