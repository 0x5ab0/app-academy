class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :reponses do |t|
      t.integer :respondent_id, null: false
      t.integer :answer_choice_id, null: false

      t.timestamps
    end

    add_index :reponses, :respondent_id
    add_index :reponses, :answer_choice_id
  end
end
