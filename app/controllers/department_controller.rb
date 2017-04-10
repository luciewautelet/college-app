class DepartmentController < ApplicationController
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(department_params)
  
    if @department.save
      redirect_to :action => 'new'
    end
  end
  
  def show
    @department = Department.first
    @department.programmes
  end
  
  private
  
  def department_params
    params.require(:department).permit(:dname, :department_id)
  end
  
end
