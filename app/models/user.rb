class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nick_name,          presence: true
validates :email,              presence: true, uniqueness: true,       format: { with: /\A[^@\s]+@[^@\s]+\z/ }
validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
validates :first_name,         presence: true
validates :last_name,          presence: true
validates :first_kana_name,    presence: true
validates :last_kana_name,     presence: true
validates :birth_day,          presence: true
end
