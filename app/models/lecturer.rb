class Lecturer < ActiveRecord::Base
    has_secure_password

    validates :password_digest, length: { minimum: 6 }

    has_many :course_modules
    belongs_to :programs
    
end
