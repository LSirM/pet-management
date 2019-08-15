class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|

      t.string 'name'
      t.float 'monthly_cost'
      t.references :person
      t.references :animal_type

      t.timestamps
    end
  end
end
