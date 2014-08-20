class User < ActiveRecord::Base
  validates :full_name,
            presence: true,
            length:   { maximum: 50 }

  # validates :role,
  #           presence: true

  validates :email,
            presence:   true,
            length:     { maximum: 50 },
            format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: true }

  validates :password,
            presence:     true,
            length:       { in: 6..40 },
            confirmation: true

  has_secure_password
end
