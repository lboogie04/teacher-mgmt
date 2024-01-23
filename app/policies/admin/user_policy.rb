module Admin
  class UserPolicy < ::AdminPolicy
    class Scope < Scope
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
  
    def create?
      admin?
    end
  
    def update?
      admin?
    end
  
    def destroy?
      admin?
    end
  end
end