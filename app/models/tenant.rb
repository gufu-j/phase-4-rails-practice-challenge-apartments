class Tenant < ApplicationRecord
has_many :leases
has_many :apartments, through: :leases

validates :name, presence: true 
validates :age, numericality: {greater_than_por_equal_to: 18, message: "must be older than 18 years old"}

end
