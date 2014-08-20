class User < ActiveRecord::Base
  validates :full_name,
            presence: true,
            length: { maximum: 50 }

  # validates :role,
  #           presence: true

  validates :email,
            presence:   true,
            length:     { maximum: 50 },
            format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: true }

  validates :password,
            presence: true,
            length: { in: 6..40 },
            confirmation: true

  # before_save :encrypt_password

  has_secure_password
  #
  # def has_password?(submitted_password)
  #   encrypted_password == encrypt(submitted_password)
  # end
  #
  # def self.authenticate(email, submitted_password)
  #   user = find_by_email(email)
  #   return nil  if user.nil?
  #   return user if user.has_password?(submitted_password)
  # end
  #
  # private
  #
  # def encrypt_password
  #   self.salt = make_salt
  #   self.encrypted_password = encrypt(params[:password])
  # end
  #
  # def encrypt(string)
  #   secure_hash("#{salt}#{string}")
  # end
  #
  # def make_salt
  #   secure_hash("#{Time.now.utc}#{password}")
  # end
  #
  # def secure_hash(string)
  #   Digest::SHA2.hexdigest(string)
  # end
end
