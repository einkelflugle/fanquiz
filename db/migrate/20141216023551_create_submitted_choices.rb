class CreateSubmittedChoices < ActiveRecord::Migration
  def change
    create_table :submitted_choices do |t|
      t.references :result, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
