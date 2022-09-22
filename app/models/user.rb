class User < ApplicationRecord

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy

  # before_action :authenticate_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
