class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable

  has_many :user_preferences, dependent: :delete_all
  has_many :thirdparties, dependent: :delete_all
  has_many :services, :through => :thirdparties

  def as_json(options={})
    {
      id: self.id,
      email: self.email
    }
  end

end
