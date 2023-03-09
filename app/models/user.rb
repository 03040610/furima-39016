class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nick_name,          presence: true
validates :email,              presence: true, uniqueness: true,                        format: { with: /\A[^@\s]+@[^@\s]+\z/ }
validates :password,           presence: true, length: { minimum: 6 },                  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龯]+\z/ }
validates :first_kana_name,    presence: true, format: { with: /\A[ァ-ヶー]+\z/}
validates :last_kana_name,     presence: true, format: { with: /\A[ァ-ヶー]+\z/}
validates :birth_day,          presence: true
end
