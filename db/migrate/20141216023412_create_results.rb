class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true
      t.references :quiz, index: true

      t.timestamps
    end
  end
end
