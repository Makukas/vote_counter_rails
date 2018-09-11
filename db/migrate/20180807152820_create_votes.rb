class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :question
      t.string :answer1
      t.string :answer2
      t.integer :numberOfAnswers1
      t.integer :numberOfAnswers2

      t.timestamps
    end
  end
end
