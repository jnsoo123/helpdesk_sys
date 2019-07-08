class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets

  validates :role, inclusion: { in: Users::Roles::ALL }

  def admin?
    self.role == Users::Roles::ADMIN
  end
end
