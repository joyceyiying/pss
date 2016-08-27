class CreatePsses < ActiveRecord::Migration[5.0]
  def change
    create_table :psses do |t|
      t.string :computer
      t.string :player
      t.string :win_lose

      t.timestamps
    end
  end
end
