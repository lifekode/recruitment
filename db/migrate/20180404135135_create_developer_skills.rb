class CreateDeveloperSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :developer_skills do |t|
      t.references :developer, foreign_key: true
      t.references :programming_language, foreign_key: true

      t.timestamps
    end
  end
end
