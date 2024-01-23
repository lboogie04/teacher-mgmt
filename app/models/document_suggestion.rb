class DocumentSuggestion < ApplicationRecord
  belongs_to :document
  belongs_to :user

  before_validation :set_default_status

  validates :status, inclusion: { in: %w[pending received denied] }

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
