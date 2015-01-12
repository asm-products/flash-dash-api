class Thirdparty < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  validates_presence_of :username
  validates_presence_of :user_id
  validates_presence_of :service_id
  
end
