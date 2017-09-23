class Update < ApplicationRecord
  belongs_to :project
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?

  validates :title, :description, presence: true

  def set_defaults
    self.approval ||= false
  end
end
