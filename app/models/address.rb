class Address < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  
  belongs_to :user, optional: true

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture, presence: true 
  validates :city, presence: true
  validates :address, presence: true 
  validates :tel, allow_blank: true, format: { with: /\A\d{10,11}\z/ }

end
