class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(params_student)
    redirect_to student_path(@student)
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(params_student).valid?
      @student.update(params_student)
    else
      render :edit
    end
    # redirect_to student_path(@student)
  end

  def delete
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private
  def params_student
    params.require(:student).permit(:name, :mod)
  end

end
