class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string 'name'
      t.string 'document'
      t.datetime 'dt_birth'

      t.timestamps
    end
  end
end
