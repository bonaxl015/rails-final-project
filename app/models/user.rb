class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3 },
                       format: { with: /\A[A-Za-z0-9]+\z/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :posts
end
