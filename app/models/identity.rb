class Identity
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # Relations
  belongs_to :user

  def self.find_with_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'], email: auth['info']['email'])
  end
end