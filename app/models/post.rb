# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  body       :text
#  project_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  syntax     :string
#

class Post < ApplicationRecord
  belongs_to :project
end
