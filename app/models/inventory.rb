class Inventory < ApplicationRecord
  belongs_to :movie
  has_many :items
  enum inventory_type: {
      custom: 1,
      food: 3,
      equipment: 4,
      costumes: 5
  }

  scope :cars, -> {
    where(inventory_type: "cars")
  }

  ICONS = {
      custom: "asterisk",
      cars: "car",
      food: "food",
      equipment: "chain",
      customes: "dress"
  }
end
