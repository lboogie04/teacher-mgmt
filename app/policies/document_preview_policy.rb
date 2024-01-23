class DocumentPreviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    protected

    def see_all?
      true
    end
  end

  def index?
    student?
  end

  def show?
    true
  end
end