module Admin
    class DocumentsController < Admin::BaseController
      layout "admin"

      before_action :set_document, only: [:destroy]
  
      def index
        @documents = Document.includes(:user, :document_suggestions).all
      end

      def new
        @document = Document.new
        @users = User.with_role(:teacher)
      end

      def create
        @document = Document.new(document_params)
  
        if @document.save
          redirect_to admin_documents_path, notice: 'Document was successfully created.'
        else
          @users = User.with_role(:teacher)
          render :new
        end
      end

      def destroy
        authorize @document
        @document.destroy
        redirect_to admin_documents_path, notice: 'Document was successfully deleted.'
      end

    private

    def set_document
        @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:user_id, :document_type, :slug, :name, :content, :file)
    end


    end
  end
  