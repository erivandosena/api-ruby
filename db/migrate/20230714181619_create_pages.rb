class CreatePages < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:pages)
      create_table :pages do |t|
        t.string :title
        t.text :description
        t.boolean :active

        t.timestamps
      end
    end
  end
end