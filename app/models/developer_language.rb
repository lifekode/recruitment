class DeveloperLanguage < ApplicationRecord
  # Association
  belongs_to :developer
  belongs_to :language

  # Validations
  validates :developer_id, uniqueness: { scope: :language_id }
end
