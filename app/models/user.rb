class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, :password, presence: true

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  
end
