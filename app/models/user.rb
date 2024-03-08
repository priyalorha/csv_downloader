# frozen_string_literal: true

# app/models/user.rb

class User < ApplicationRecord
  has_many :orders
  validates :username, :email, :phone, presence: true
end
