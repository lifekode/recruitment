class CreateProgrammingLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :programming_languages do |t|
      t.string  :name, unique: true
      t.timestamps
    end
  end
end
