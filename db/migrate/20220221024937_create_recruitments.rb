class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.string :game_title, null: false
      t.string :recruitment_title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
