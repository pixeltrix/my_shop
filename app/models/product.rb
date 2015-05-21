class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  validates :colour, length: { maximum: 30 }

  alias_attribute :color, :colour

  scope :colour, ->(colour) { where(colour: colour) }

  def self.default_scope
    order(arel_table[:created_at].desc)
  end
end
