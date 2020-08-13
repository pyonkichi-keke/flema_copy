class Product < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    Product.where('name LIKE(?)', "%#{search}%")
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :deliverytime
  belongs_to_active_hash :delivery
  

  validates :name, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true
  validates :status_id, presence: true
  validates :prefecture_id, presence: true
  validates :size_id, presence: true
  validates :delivery_id, presence: true
  validates :deliverytime_id, presence: true

end
