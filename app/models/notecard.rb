class Notecard < ActiveRecord::Base
    validates :concept, presence: true, on: :create
    validates :definition, presence: true, on: :create
    belongs_to :user
end
