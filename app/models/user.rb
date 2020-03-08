class User < ActiveRecord::Base
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_many :notecards
    has_secure_password
end
