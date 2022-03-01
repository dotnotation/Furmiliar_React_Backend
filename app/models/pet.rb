class Pet < ApplicationRecord
    has_many :toys
    validates :name, presence: true
end
