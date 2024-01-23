class HomePolicy < ApplicationPolicy
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
      true
    end
  
    def show?
      true
    end
  
    def edit?
      true
    end
  
    def create?
      true
    end
  
    def update?
      true
    end
  
    def destroy?
      true
    end
  
    def download?
      true
    end
  
  end