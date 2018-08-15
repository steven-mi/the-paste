class User < ApplicationRecord
    acts_as_authentic do |c|
        c.log_in_after_create = true
    end
end
