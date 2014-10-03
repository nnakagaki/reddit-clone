class User < ActiveRecord::Base
  after_initialize preset_session_token

  validates :name, :email, :password_digest, presence: true
  validates :name, :email, uniqueness: true


  def set_session_token!
    self.session_token = SecureRandom::urlsafe_base64(12)
    save!

    self.session_token
  end

  private
  def preset_session_token
    self.sesion_token = SecureRandom::urlsafe_base64(12)
  end

end
