class GradeController < ApplicationController
    
    def list
        @grades = Grade.all
    end
    
    def show
        
    end
    
    def new
        @grades = Grade.new
    end
    
    def create
        @grades = Grade.new(grade_params)
        if @grades.save
            redirect_to authorized_path
        else
            redirect_to denied_path
            render 'new'
        end
    end
    
    def modget
        Grade.update(params[:grade][:id], "grade" => params[:grade][:grade])
        redirect_to home_path
    end
    
    def modify
        @grades = Grade.new
        @user_id = params[:uid]
        @module_id = params[:mid]
        @module = CourseModule.where(course_module_id: @module_id)
        @userone = Student.where(student_id: @user_id)
        @id = Grade.select("id", "grade").where(student_id: @user_id, module_id: @module_id)
        
    end
    
    def addget
       gr = Grade.new(grade_add)
       gr.save
        redirect_to home_path
    end
    
    def add
        @grades = Grade.new
        @user_id = params[:uid]
        @module_id = params[:mid]
        @module = CourseModule.where(course_module_id: @module_id)
        @userone = Student.where(student_id: @user_id) 
        @id = Grade.maximum("id")
        if @id
            @id = @id + 1
        else
            @id = 0
        end

    end
    
    private


    def grade_add
        params.require(:grade).permit( :id, :student_id, :module_id, :grade)

    end

    def grade_params
         params.require(:grade).permit( @id, @user_id, @module_id, :grade)
    end 
    
end
