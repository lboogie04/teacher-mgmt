class DocumentPreviewsController < ApplicationController
  layout "document_preview"
  before_action :authenticate_user!, except: [:show]

  def index
    @documents = Document.all
    render layout: 'application'
  end

  def show
    @document = Document.find_by(slug: params[:slug])

    if @document && @document.file.attached? && @document.document_type == "markdown"
      impressionist(@document)
      markdown_content = @document.file.download
      @html_content = MarkdownTranslator.convert(markdown_content) 
    elsif @document && @document.file.attached?
      render "show"
    else
      # Handle case when document is not found
      render plain: 'Document not found', status: :not_found
    end
  end

end