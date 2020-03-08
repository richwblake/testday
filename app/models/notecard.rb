class Notecard < ActiveRecord::Base
    validates :concept, presence: true
    validates :definition, presence: true
    belongs_to :users
end
