class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def show
    @courses = Course.all
  end

  def edit
  end

  def destroy
  end

  def create
  end
end
