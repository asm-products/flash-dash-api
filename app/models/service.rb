class Service < ActiveRecord::Base
  validates_presence_of :service
  validates_presence_of :url

  has_many :thirdparties
  has_many :users, :through => :thirdparties
end
