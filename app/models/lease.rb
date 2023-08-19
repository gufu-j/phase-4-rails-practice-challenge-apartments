class Lease < ApplicationRecord
    belongs_to :apartment
    belongs_to :tenant

    validates :number, numericality: {only_integer: true}
end
