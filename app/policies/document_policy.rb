class DocumentPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        return scope.none unless user_has_operational_role?
    
        scope.all
      end
  
      protected
  
      def see_all?
        operational_role?
      end

      def user_has_operational_role?
        user.operational_role?
      end
    end
  
    def index?
      operational_role?
    end
  
    def show?
      operational_role?
    end
  
    def edit?
      operational_role?
    end
  
    def create?
      operational_role?
    end
  
    def update?
      operational_role?
    end
  
    def destroy?
      operational_role?
    end
  
    def download?
      operational_role?
    end
  
  end