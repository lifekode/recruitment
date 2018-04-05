class ProgrammingLanguage < ApplicationRecord
  # Association
  has_many :developer_skills
  has_many :developers, through: :developer_skills

  # Validation
  validates :name, presence: true, uniqueness: true
end
