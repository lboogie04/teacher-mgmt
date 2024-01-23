class ApplicationController < ActionController::Base
  include Pundit::Authorization

    protect_from_forgery with: :exception
    before_action :set_paper_trail_whodunnit
    before_action :authenticate_user!
    around_action :set_active_storage_url_options

    def after_sign_in_path_for(resource)
        if resource.has_role?(:admin)
            admin_dashboard_index_path
        else
          root_path
        end
    end

    private

    def set_active_storage_url_options
      previous_url_options = ActiveStorage::Current.url_options.dup
      ActiveStorage::Current.url_options = { host: request.base_url }
  
      yield
    ensure
      ActiveStorage::Current.url_options = previous_url_options
    end
end
