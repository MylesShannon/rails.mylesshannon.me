class User < ActiveRecord::Base
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.get_user(user_id)
    User.find(user_id)
  end
end
