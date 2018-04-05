class Developer < ApplicationRecord
  include PgSearch
  pg_search_scope :quick_search, against: [:email],
                  :using => { :tsearch => { :prefix => true } }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Association
  has_many :developer_skills
  has_many :skills, through: :developer_skills, source: :programming_language

  has_many :developer_languages
  has_many :languages, through: :developer_languages, source: :language

  # Validation
  validates :email, presence: true, uniqueness: true

  # CallBack
  before_save :downcase_email

  private
  def downcase_email
    self.email = email.downcase
  end
end
