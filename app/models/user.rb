class User < ApplicationRecord
    before_save {self.email = email.downcase }
    validates :first_name, presence: true,
                    length: { minimum: 1 }
    validates :last_name, presence: true,
                    length: { minimum: 1 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    uniqueness: {case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
    validates :user, presence: true,
                    uniqueness: {case_sensitive: false },
                    length: { minimum: 3, maximum: 25 }
end
