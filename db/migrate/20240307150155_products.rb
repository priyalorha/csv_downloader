# frozen_string_literal: true

class Products < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
