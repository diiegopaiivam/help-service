class Conection < ApplicationRecord
  belongs_to :employee

  scope :count_connections, -> (employee_id){
    Conection.select("count(*)").where(employee_id: employee_id)
  }
end
