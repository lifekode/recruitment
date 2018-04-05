class Language < ApplicationRecord
  # Association
  has_many :developer_languages
  has_many :developers, through: :developer_languages

  # Validation
  validates :code, presence: true, uniqueness: true
end
