class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :category, foreign_key: true
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end