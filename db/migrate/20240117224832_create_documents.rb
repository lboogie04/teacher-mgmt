class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :document_type, null: false
      t.string :slug
      t.string :name

      t.timestamps
    end

    add_index :documents, :slug, unique: true
  end
end
