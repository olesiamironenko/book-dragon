class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, password_strength: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
