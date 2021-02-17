class Comment < ApplicationRecord
  belongs_to :employee

  # Paginação 
  paginates_per 5

  # Validações
  validates_length_of :description, minimum: 5, message: 'attribute must have minimum 5 character'
  validates_presence_of :employee_id, message: 'attribute is required'

  # Listar comentários de um usuário
  scope :search_comments, -> (page, employee_id){
    includes(:employee)
      .where(employee_id: employee_id)
      .page(page)
  } 

end
