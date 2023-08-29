class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name_ch, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_ch, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :first_name, presence: true, format: { with:/\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth, presence: true

end
