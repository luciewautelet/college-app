class ProgrammeController < ApplicationController
  def newp
    @programme = Programme.new
  end
  
  def createp
    @programme = Programme.new(programme_params)
    
    if @programme.save
      redirect_to :action => 'newp'
    end  
  end
  
  private
  
  def programme_params
    params.require(:programme).permit(:code, :pname, :department_id)
  end
    
end
