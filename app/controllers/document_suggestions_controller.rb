class DocumentSuggestionsController < ApplicationController

  def new
    @document = Document.find(params[:document_id])
    @suggestion = DocumentSuggestion.new
  end

  def create
    @document = Document.find(params[:document_id])
    @suggestion = current_user.document_suggestions.build(suggestion_params.merge(document: @document))

    if @suggestion.save
      redirect_to @document, notice: 'Suggestion submitted successfully.'
    else
      render :new
    end
  end

  private

  def suggestion_params
    params.require(:document_suggestion).permit(:suggested_content, :status)
  end
end
