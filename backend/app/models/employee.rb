class Employee < ApplicationRecord
  belongs_to :profession
  has_many :comments
  has_many :ratings

  #imageuse
  has_one_attached :image

  # Paginação 
  paginates_per 10

  ## Validações
  validates_presence_of :first_name, message: 'attribute is required'
  validates_presence_of :last_name, message: 'attribute is required'
  validates_presence_of :latitude, message: 'attribute is required'
  validates_presence_of :longitude, message: 'attribute is required'
  validates_presence_of :email, message: 'attribute is required and unic'
  validates_presence_of :phone, message: 'attribute is required'

  validates_length_of :phone, minimum: 10, message: 'attribute have 11 numbers'

  validates_uniqueness_of :email, message: 'attribute is unic'
  validates_uniqueness_of :phone, message: 'attribute is unic'

   
end
