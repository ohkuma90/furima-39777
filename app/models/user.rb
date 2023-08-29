class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  columns = [
    :name,
    :email,
    :encrypted_password,
    :last_name_ch,
    :first_name_ch,
    :last_name,
    :first_name,
    :date_of_birth
  ]
  columns.each do |c|
    validates c, presence: true
  end
end
