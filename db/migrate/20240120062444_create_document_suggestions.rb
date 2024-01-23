class CreateDocumentSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :document_suggestions do |t|
      t.references :document, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :suggested_content
      t.string :status

      t.timestamps
    end
  end
end
