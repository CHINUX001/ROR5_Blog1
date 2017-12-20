class User < ApplicationRecord
    has_many :articles #articles beacause its one to many
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    has_secure_password
    
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: {minimum: 3, maximum: 50} 
    validates :email, presence: true, length: {maximum: 30} ,format:{with:VALID_EMAIL_REGEX} 
    
end