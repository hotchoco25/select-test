class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string     :topic_name, null: false
      t.string     :creator,    null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
