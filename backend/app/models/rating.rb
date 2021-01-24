class Rating < ApplicationRecord
  belongs_to :employee

  # Validações
  validates_inclusion_of :classification, :in => 1..10, message: 'avaliation not valid'

  # Calcular média de classificação de trabalhador
  scope :calculate_avg_employee, -> (employee_id){
    Rating.select('AVG(classification)').where(employee_id: employee_id)
  }
end
