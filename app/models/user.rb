class User < ApplicationRecord
  has_many :requests
  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :confirmable
  def remember_me
    true
  end
end
