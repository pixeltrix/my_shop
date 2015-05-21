class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000 }

end
