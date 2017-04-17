class StaticPagesController < ApplicationController
  def home
      print session[:type]
     if session[:user_id] && session[:type] == "student"
           redirect_to homest_path
      elsif session[:user_id] && session[:type] == "admin"
          redirect_to homead_path
        elsif session[:user_id] && session[:type] == "professor"
            redirect_to homele_path
      else
            redirect_to login_path
        end
  end

  def help
  end
  
  def about
  end  
  
  def contact
  end  
end
