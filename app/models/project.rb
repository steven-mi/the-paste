class Project < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3 }
end
