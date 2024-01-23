class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    protected

    def see_all?
      true
    end
  end

  def edit?
    true
  end

  def update?
    true
  end
end