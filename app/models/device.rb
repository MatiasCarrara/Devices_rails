class Device < ApplicationRecord
  validates :name, :address, presence: true
end
