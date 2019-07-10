class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable,r and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
end
