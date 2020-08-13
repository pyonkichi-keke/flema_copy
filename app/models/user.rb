class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         


      has_many :commnets
      has_many :products
      has_many :likes_product, through: :likes, source: :product
      has_many :comments, dependent: :destroy
      has_many :likes, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :credit_cards, dependent: :destroy
      has_one :address, dependent: :destroy         


      VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

      validates :nickname, presence: true
      validates :email, presence: true, uniqueness: true, format:{with: VALID_EMAIL}
      validates :password, presence: true, confirmation: true, length: { minimum: 7 }
      validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
      validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
      validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ } 
      validates :birthday, presence: true, length: { is: 8 }, format: { with: /\A[0-9]+\z/ }

end
