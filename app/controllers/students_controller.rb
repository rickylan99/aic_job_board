class StudentsController < ApplicationController
 
  def index
    @student = Student.all 
  end
  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
  end

  def show
  end

  def edit
  end

  def delete
  end
  private
  def student_params
    params.require(:student).permit(:email, :first_name, :last_name, :classification,:phone_number,:file_name,:file_id,:q1,:q2,:q3,:q4)
  end
end
