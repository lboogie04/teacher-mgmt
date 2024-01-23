module Admin
    class DashboardController < Admin::BaseController
      layout "admin"
  
      def index
        @total_docs_count = Document.all.count
        @total_teachers_count = User.with_role(:teacher).count
        @total_impressionist_count = Document.all.inject(0) { |sum, document| sum + document.impressionist_count(start_date: Date.today) }
        @documents_today = Document.includes(:user).where('DATE(created_at) = ?', Date.today)
      end
    end
  end
  