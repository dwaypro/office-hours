class Update < ApplicationRecord
  belongs_to :project
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?

  validates :title, :description, presence: true

  def set_defaults
    self.approval ||= false
    self.status ||= 0
  end

  def convert_status
    case self.status
    when 4
      "Closed"
    when 3
      "Final Review"
    when 2
      "Final tests"
    when 1
      "In progress"
    else
      "Pending approval"
    end

  end
end
