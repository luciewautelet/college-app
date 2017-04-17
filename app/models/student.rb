class Student < ActiveRecord::Base
    has_secure_password

    validates :password_digest, length: { minimum: 6 }
    
    has_many :grades
    belongs_to :program
end
