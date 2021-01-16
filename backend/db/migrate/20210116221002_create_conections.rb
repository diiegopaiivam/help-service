class CreateConections < ActiveRecord::Migration[6.1]
  def change
    create_table :conections do |t|
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
