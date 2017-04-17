class ProgramController < ApplicationController
  def new
    @program = Program.new
  end
  
  def create
    @program = Program.new(program_params)
  
    if @program.save
      redirect_to :action => 'new'
    end
  end
  
  def show
    @program = Program.first
    @program.course_modules
  end
  
  private
  
  def program_params
    params.require(:program).permit(:pname, :program_id, :admin_id)
  end
  
end
