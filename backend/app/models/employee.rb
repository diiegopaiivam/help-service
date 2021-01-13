class Employee < ApplicationRecord
  belongs_to :profession
  has_many :comment
  has_many :rating
end
