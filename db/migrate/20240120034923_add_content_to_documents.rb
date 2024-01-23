class AddContentToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :content, :text
  end
end
