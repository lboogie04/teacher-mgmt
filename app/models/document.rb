class Document < ApplicationRecord
  is_impressionable
  has_paper_trail on: [:update]
  
  belongs_to :user
  has_many :document_suggestions, dependent: :destroy

  has_one_attached :file

  validates :document_type, presence: true#, inclusion: { in: %w(markdown) }
  validates :slug, uniqueness: true, presence: true

  before_validation :set_document_type
  before_validation :generate_slug, if: -> { slug.blank? }

  private

  def generate_slug
    self.slug = "#{SecureRandom.hex(8)}"
  end

  def set_document_type
    # Check if the file is attached and has content type
    if file.attached? && file.content_type.present?
      self.document_type = extract_file_type(file.content_type)
    end
  end

  def extract_file_type(content_type)
    content_type_mapping = {
      "text/markdown" => "markdown",
      "image/jpeg" => "jpeg",
      "application/pdf" => "pdf",
    }

    # Find the matching file type
    content_type_mapping.each do |type, file_type|
      return file_type if content_type.include?(type)
    end

    "other"
  end
end
