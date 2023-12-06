class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role 
  has_many :user_customers, dependent: :destroy
  has_many :customers, through: :user_customers 
  validates :role, presence: true
end