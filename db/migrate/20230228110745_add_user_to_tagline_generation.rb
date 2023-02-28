class AddUserToTaglineGeneration < ActiveRecord::Migration[7.0]
  def change
    add_reference :tagline_generations, :user, null: true, foreign_key: true
  end
end
