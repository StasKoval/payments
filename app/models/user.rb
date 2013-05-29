class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #validates :email,:uniqueness => true, :allow_blank => true

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me



  after_create :default_role

  has_many :payments

  def self.find_for_authentication(conditions)

    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

=begin
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => username.downcase }]).first
    else
      where(conditions).first
    end
  end
=end

  def email_required?
    false
  end

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

  def sky?
    self.try(:role) == 'sky'
  end

  def icn?
    self.try(:role) == 'icn'
  end

  def admin?
    self.try(:role)=='admin'
  end


  private
  def default_role
    self.role = 'sky'
    self.save
  end


end
