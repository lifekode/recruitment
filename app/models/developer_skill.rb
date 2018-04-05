class DeveloperSkill < ApplicationRecord
  # Association
  belongs_to :developer
  belongs_to :programming_language

  # Validations
  validates :developer_id, uniqueness: { scope: :programming_language_id }
end
