class Users < ApplicationRecord
  has_secure_password

  class << self
    def admin
      first
    end
  end
end
