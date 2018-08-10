class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments
  has_many :joins
  has_many :joined_events, through: :joins, source: :event

  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :password, length: { minimum: 8 }, on: :create

end
