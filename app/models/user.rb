class User < ApplicationRecord
  has_many :reading_lists, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, password_strength: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add callback to create default lists after user creation 
  after_create :create_default_reading_lists
  
  private
  # Define the method that creates default lists
  def create_default_reading_lists 
    reading_lists.create(name: 'Books I Read') 
    reading_lists.create(name: 'Books I am Reading') 
    reading_lists.create(name: 'Books I Want to Read') 
    reading_lists.create(name: 'My Favorite Books')
  end

end
