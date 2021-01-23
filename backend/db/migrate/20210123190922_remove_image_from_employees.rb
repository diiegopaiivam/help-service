class RemoveImageFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :image
  end
end
