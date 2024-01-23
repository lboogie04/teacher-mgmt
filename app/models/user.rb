class User < ApplicationRecord
  rolify
  audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :documents
  has_many :document_suggestions, dependent: :destroy

  validates :status, inclusion: { in: %w(active inactive) }, allow_nil: true
  # validates :username, uniqueness: true

  before_create :set_default_status

  # TODO: address performant issues with these methods
  def operational_role?
    self.has_any_role?(:admin, :teacher)
  end

  def admin?
    self.has_role?(:admin)
  end

  def teacher?
    self.has_role?(:teacher)
  end

  def student?
    self.has_role?(:student)
  end

  private

  def set_default_status
    self.status ||= 'active'
  end 
end
