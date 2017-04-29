# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :session_token, presence: true
  validates :password, length: { allow_nil: true, minimum: 6 }
  attr_reader :password
  before_validation ensure_session_token!

  def generate_session_token
    RandomSecure.urlsafe_base64(16)
  end

  def password=(password)
    self.password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token!
    @session_token ||= generate_session_token
  end
  def reset_session_token
    @session_token = generate_session_token
    
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest) == password
  end
end
