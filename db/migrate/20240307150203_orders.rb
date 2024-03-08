# frozen_string_literal: true

class Orders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :order_date, null: false
      t.timestamps
    end
  end
end
