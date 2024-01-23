class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none unless see_all?

      scope.all
    end

    protected

    def see_all?
      admin?
    end
  end

  def index?
    admin?
  end

  def show?
    admin?
  end

  def edit?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def download?
    true
  end

end