class User < ActiveRecord::Base
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true, on: :create
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_many :notecards
    has_secure_password

    def slug
        username.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end
