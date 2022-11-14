class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end
    add_index :ideas, :title, unique: true
  end
end
