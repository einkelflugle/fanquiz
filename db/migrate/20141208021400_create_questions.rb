class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.references :quiz, index: true

      t.timestamps
    end
  end
end
