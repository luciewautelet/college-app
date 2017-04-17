class CourseModuleController < ApplicationController
  
  def assign
    set_current_user
    @lecturer = Lecturer.find_by(lecturer_id: params[:lecturer_id])
    @modules = CourseModule.where(lecturer_id: [0,])
    
  end
  
  def assget
    set_current_user
    @module = params[:module_id]
    @lecturer = params[:lecturer_id]
    CourseModule.where(course_module_id: @module).update_all(lecturer_id: @lecturer)
    redirect_to home_path
  end
  
  def deluser
    set_current_user
    @module = params[:module_id]
CourseModule.where(course_module_id: @module).update_all(lecturer_id: 0)
    redirect_to home_path
  end
  
  def newm
    @course_module = CourseModule.new
  end
  
  def createm
    @course_module = CourseModule.new(module_params)
    
    if @course_module.save
      redirect_to :action => 'newm'
    end  
  end
  
  
  private

  
  def module_params
    params.require(:course_module).permit(:course_module_id, :mname,
                    :program_id, :lecturer_id, :admin_id, :deadline)
  end
    
    def set_current_user
        if !session[:user_id] || session[:type] != "admin"
            redirect_to login_path
        end
    end
end
