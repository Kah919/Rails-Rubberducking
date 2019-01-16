class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
    @student = Student.all
  end

  def create
    @duck = Duck.create(params_duck)
    if @duck.valid?
     redirect_to duck_path(@duck)
    else
      flash[:error] = @duck.errors.full_messages
      @student = Student.all
      render :new
    end
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    @duck.update(params_duck)
    redirect_to duck_path(@duck)
  end

  def delete
    @duck = Duck.find(params[:id])
    @duck.destroy
    redirect_to ducks_path
  end

  private
  def params_duck
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
