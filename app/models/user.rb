class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :password_digest, presence: true
  validates :name, uniqueness: true

  def mood
    happiness > nausea ? 'happy' : 'sad'
  end
end
