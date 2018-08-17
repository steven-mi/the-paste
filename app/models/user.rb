# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  email              :string
#  crypted_password   :string
#  password_salt      :string
#  persistence_token  :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  login_count        :integer          default(0), not null
#  failed_login_count :integer          default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string
#  last_login_ip      :string
#

class User < ApplicationRecord
    acts_as_authentic do |c|
        c.log_in_after_create = true
    end
end
