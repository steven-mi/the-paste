# == Schema Information
#
# Table name: projects
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3 }
end
