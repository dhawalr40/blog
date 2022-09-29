class User < ApplicationRecord
  rolify
  # resourcify

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :assign_default_role

  # validates :phone, presence: true, length: { minimum: 10 }

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  # before_action :authenticate_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
