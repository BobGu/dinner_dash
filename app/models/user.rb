require 'bcrypt'

class User < ActiveRecord::Base
  validates :email,     presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :role,      presence: true

  include BCrypt

  def self.create(data)
    user           = User.new
    user.salt      = BCrypt::Engine.generate_salt
    user.digest    = BCrypt::Engine.hash_secret(data[:password], user.salt)
    user.email     = data[:email]
    user.full_name = data[:full_name]
    user.role      = data[:role]
    user.save
    user
  end

  def self.authenticate(data)
    user = User.find_by(:email => data[:email])
    # the password and the salt that is runs through the hashing function
    attempt = BCrypt::Engine.hash_secret(data[:password], user.salt)

    if user.digest == attempt
      user
    end
  end

  def self.authenticate?
  end

  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     give_token
  #   else
  #     redirect_to items_path
  #   end
  # end

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end


end
