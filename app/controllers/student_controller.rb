class StudentController < ApplicationController
    
    # needs basics methods for a user
    
    # up to 5 modules/semester (at least 3 for the grading system)
    # view course_modules list with grades
    # can cancel a course_modules subscription within 3 weeks
    #                                           after start of semester
            
        
    def home
        set_current_user
        @user = Student.select(:course_module_ids).where(student_id: @current_user.student_id)
        @program = Program.find_by(program_id: @current_user.program_id)
         @modules = CourseModule.where(program_id: @program.program_id)
         @grades = Grade.where(student_id: @current_user.student_id)
    end
    
    def set_current_user
        print session[:user_id]
        if session[:user_id] && session[:type] == "student"
           @current_user = Student.find_by(student_id: session[:user_id])
        else
            redirect_to login_path
        end
    end
    
    def subscribe
        @current_id = session[:user_id]
        @module_id = params[:mid]
        @modules= Student.select(:course_module_ids).where(student_id: @current_id)
        if (@modules[0][:course_module_ids] && @modules[0][:course_module_ids] != "")
                @mod = @modules[0][:course_module_ids] +";"+ @module_id
        else
            @mod = @module_id
        end
        Student.update(@current_id, "course_module_ids" => @mod)
        redirect_to home_path
    end
        
    def insuscribe
     @current_id = session[:user_id]
        @module_id = params[:mid]
        @modules= Student.select(:course_module_ids).where(student_id: @current_id)
        counter = 0
        @mod = ""
        print @modules[0][:course_module_ids]
                @modules[0][:course_module_ids].split(";").each do |t|
                   print t
                   print "_"
                    if (Integer(t) != Integer(@module_id))
                       print "false"
                        if (counter != 0)
                           print ";"
                            @mod = @mod + ";"
                        end
                        @mod = @mod + t.to_s
                        counter = counter + 1
                    end
                end
        print "-"
        print @mod
        Student.update(@current_id, "course_module_ids" => @mod)
        redirect_to home_path
    end
    
    def new
        @students = Student.new
    end
                 
    def create
        @students = Student.new(student_params)
        if @students.save
            redirect_to login_path
        else
            render 'new'
        end
    end
    
    private
    
    def student_params
         params.require(:student).permit(:student_id, :name, :password,:password_confirmation, "", :program_id)
    end 
    
    


end
