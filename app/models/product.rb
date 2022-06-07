class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  monetize :price_cents, numericality: { greater_than: 0 }, allow_nil: false

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end


# monetize :price_cents, numericality: true, allow_nil: false