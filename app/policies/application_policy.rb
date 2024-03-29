class ApplicationPolicy
  attr_reader :user, :record

  class NotAuthorizedError < Pundit::NotAuthorizedError
  end

  class UserSuspendedError < NotAuthorizedError
  end

  class UserRequiredError < NotAuthorizedError
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def admin?
    user.admin?
  end

  def teacher?
    user.teacher?
  end

  def student?
    user.student?
  end

  def operational_role?
    user.operational_role?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "User must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    protected

    def admin?
      user.admin?
    end

    def teacher?
      user.teacher?
    end

    def student?
      user.student?
    end

    def operational_role?
      user.operational_role?
    end

  end
end
