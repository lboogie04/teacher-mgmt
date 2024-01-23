module Admin
    class BaseController < ApplicationController
      before_action :authorize_admin!

      private
    
      def authorize_admin!
        unless current_user&.has_role?(:admin)
          flash[:alert] = "You are not authorized to access this page."
          redirect_to root_path
        end
      end
    end
  end
  