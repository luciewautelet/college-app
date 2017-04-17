class SessionsController < ApplicationController

    def new
     @type = params[:type]
    end

    def create
     @type = params[:type]
     if   @type.nil? || @type.length < 1 || @type=="" ||@type == "student"
      user = Student.find_by(student_id: params[:session][:number].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = params[:session][:number]
            print "id:"
            print session[:user_id]
            session[:type] = "student"
             redirect_to home_path
        else
             redirect_to denied_path
        end
    elsif @type == "professor"
      user = Lecturer.find_by(lecturer_id: params[:session][:number].downcase)
        if user && user.authenticate(params[:session][:password])
         session[:user_id] = params[:session][:number]
         session[:type] = "professor"
             redirect_to home_path
        else
             redirect_to denied_path
        end
    elsif @type == "admin"
     user = Admin.find_by(admin_id: params[:session][:number].downcase)
        if user && user.authenticate(params[:session][:password])
             session[:user_id] = params[:session][:number]
             session[:type] = "admin"
             redirect_to home_path
        else
             redirect_to denied_path
        end
    else
            redirect_to denied_path
      end
     #   user = User.find_by(email: params[:session][:email].downcase)
      #  if user && user.authenticate(params[:session][:password])
      #       redirect_to user
      #  else
     #        redirect_to denied_path
     #   end
    end
    
        
    def destroy
    end

end  