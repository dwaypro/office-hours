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
    when 5
      "Closed"
    when 4
      "Pending review"
    when 3
      "Final tests"
    when 2
      "In progress"
    when 1
      "Approved"
    else
      "Pending approval"
    end
  end

end
