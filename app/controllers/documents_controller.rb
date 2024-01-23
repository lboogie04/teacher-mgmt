class DocumentsController < ApplicationController
  before_action :set_document, only: [:edit, :update]
    def index
      @documents = current_user.documents
    end

    def show
      @document = Document.find(params[:id])
      authorize @document
      @document_versions = @document.versions
    end

    def edit
    end

    def create
      @document = current_user.documents.build(document_params)

      if @document.save
        redirect_to @document, notice: 'Document was successfully created.'
      else
        render :new
      end
    end

    def update
      if @document.update(document_params)
        # Handle successful update (e.g., redirect to show page)
        redirect_to @document, notice: 'Document was successfully updated.'
      else
        # Handle validation errors and re-render the edit form
        render :edit
      end
    end

    def new
        @document = current_user.documents.build
    end

    def download
        @document = Document.find(params[:id])
        authorize @document
        send_data @document.file.download, filename: @document.file.filename.to_s, type: @document.file.content_type
    end
      
      private

      def set_document
        @document = Document.find(params[:id])
      end
      
      def document_params
        params.require(:document).permit(:user_id, :document_type, :slug, :name, :content, :file)
      end
end
  