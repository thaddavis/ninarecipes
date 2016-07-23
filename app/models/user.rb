class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  before_save { self.email = email.downcase }
  validates :username,  presence: true, length: { minimum: 6, maximum: 50 }
  validates :first_name,  presence: true, length: { minimum: 6, maximum: 30 }
  validates :last_name,  presence: true, length: { minimum: 6, maximum: 30 }

end
