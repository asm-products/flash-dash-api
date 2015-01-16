class Thirdparty < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  validates_presence_of :username
  validates_presence_of :user_id
  validates_presence_of :service_id
  
  def self.verify(service, current_user, username)
    site = Service.find_by_service(service)
    if current_user.thirdparties.find_by_username(username)
      return username
    else
      Thirdparty.create(:username => username, :oauth => nil, :service => site, :user => current_user)
    end
  end

end
