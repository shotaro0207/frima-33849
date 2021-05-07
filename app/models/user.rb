class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday
  end       
  
  validates :password, format: {with: /[a-z\d]{6,}/}
  validates :last_name, format: {with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, format: {with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, format: {with:  /\A[ァ-ヶ]+\z/}
  validates :first_name_kana, format: {with:  /\A[ァ-ヶ]+\z/}
end
