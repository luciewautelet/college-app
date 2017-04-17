class Admin < ActiveRecord::Base
    has_secure_password

    validates :password_digest, length: { minimum: 6 }

    
    if Admin.exists?(:admin) && isProgramAdm == true and !isSuperAdm
        belongs_to :program
        has_many :students
    else
        if Admin.exists?(:admin) && !isSuperAdm
            has_many :modules
            has_many :lecturers
        end
    end
        
end
