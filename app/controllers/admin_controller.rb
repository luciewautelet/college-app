class AdminController < ApplicationController
    # needs basics methods for a user
    
    # if isSuperAdm => allow everything
    # if isProgramAdm =>can research by student_id and name (add/remove them)
    # else => it is a course_module admin, can assign course_modules to lecturers
    #       so it needs to get list of lecturers and list of modules
    #       MAX 3 course_module / lecturer for a semester!
    
    def home
        set_current_user
        @lecturers = Lecturer.all
        @modules = CourseModule.all
    end
    
    def list
        @admins = Admin.all
    end
    
    def show
        
    end
    
    def new
        @admins = Admin.new
    end
    
    def create
        @admins = Admin.new(admin_params)
        if @admins.save
            if params[:isProgramAdm][:post] == "t"
                @isp = "1"
            else
                @isp = "0"
            end
            Admin.update(params[:admin][:admin_id], "isProgramAdm" => @isp)
            redirect_to login_path
        else
          render 'new'
        end
    end
    
        
    def admin_params
         params.require(:admin).permit(:admin_id, :name, :password,:password_confirmation,:program_id, :module_id, :isSuperAdm)
    end 
    
    def set_current_user
        if session[:user_id] && session[:type] == "admin"
           @current_user = Admin.find_by(admin_id: session[:user_id])
        else
            redirect_to login_path
        end
    end

    
end
