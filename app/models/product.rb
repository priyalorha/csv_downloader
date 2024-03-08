# frozen_string_literal: true

# app/models/product.rb

class Product < ApplicationRecord
  has_many :orders
  validates :name, :code, :category, presence: true
end
