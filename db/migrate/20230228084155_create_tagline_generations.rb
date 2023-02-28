class CreateTaglineGenerations < ActiveRecord::Migration[7.0]
  def change
    create_table :tagline_generations do |t|
      t.jsonb :parameters
      t.jsonb :response

      t.timestamps
    end
  end
end
