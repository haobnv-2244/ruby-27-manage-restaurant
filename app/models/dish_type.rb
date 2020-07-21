class DishType < ApplicationRecord
  DISH_TYPES_PARAMS = %i(name description).freeze
  has_many :dishes, dependent: :destroy

  validates :name, presence: true

  scope :dish_types, ->{order "name ASC"}
end
