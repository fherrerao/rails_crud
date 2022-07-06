class Store < ApplicationRecord
  has_many :products, dependent: :delete_all
  belongs_to :user
end
