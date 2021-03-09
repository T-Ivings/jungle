class User < ActiveRecord::Base

  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password,  :length => {
    :minimum => 6,
    :too_short => 'password must be at keast 6 characters'
  }, :on => :create


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def authenticate_self(password, password_confirmation)
    self.class.authenticate_with_credentials(password, password_confirmation)
  end


end
