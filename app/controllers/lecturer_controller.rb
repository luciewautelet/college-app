class LecturerController < ApplicationController
    # needs basics methods for a user
    
    # 3 modules/semester
    # can search by sudent_id and name
    # assign and modify grades => create new grade entry 
                                    # in db or modify one (if now < deadline)

    def home
        set_current_user
        @user = Student.select(:student_id, :name, :course_module_ids)
        @modules = CourseModule.where(lecturer_id: @current_user)
        @grades = Grade.all
        
    end
      
    def new
        @lecturers = Lecturer.new
    end
                 
    def create
        @lecturers = Lecturer.new(lecturer_params)
        if @lecturers.save
            redirect_to homele_path
        else
            render 'new'
        end
    end
    
    private
    
    def lecturer_params
         params.require(:lecturer).permit(:lecturer_id, :name, :password,:password_confirmation, -1)
    end 
    
      def set_current_user
        if session[:user_id] && session[:type] == "professor"
           @current_user = Lecturer.find_by(lecturer_id: session[:user_id])
        else
            redirect_to login_path
        end
    end
    
end
