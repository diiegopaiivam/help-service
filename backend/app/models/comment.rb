class Comment < ApplicationRecord
  belongs_to :employee

  # Paginação 
  paginates_per 5

  # Listar comentários de um usuário
  scope :search_comments, -> (page, employee_id){
    includes(:employee)
      .where(employee_id: employee_id)
      .page(page)
  } 

end
