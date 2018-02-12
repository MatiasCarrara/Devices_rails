class Device < ApplicationRecord
  validates :name, presence: true,
                    length: { maximum: 20 }
  validates :address, presence: true,
                    length: { maximum: 20 }
end
