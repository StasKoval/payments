class User < ActiveRecord::Base
  attr_accessible :email, :name, :oauth_expires_at, :oauth_token, :provider, :uid
  #before_save :create_remember_token

  after_create :default_role

  has_many :payments

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
