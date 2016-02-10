class UpdateFilm < ActiveRecord::Migration
  def change
    change_table :films do |t|
      t.integer :director_id
    end
  end
end
