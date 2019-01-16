class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(params_student)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:error] = @student.errors.full_messages
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(params_student)
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:error] = @student.errors.full_messages
      render :edit
    end
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
