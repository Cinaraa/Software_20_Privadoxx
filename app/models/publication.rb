# frozen_string_literal: true

class Publication < ApplicationRecord

  belongs_to :user
  has_many :requests
  
  validates :title, :sport, :description, :image, :price, :category, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  has_many :reviews

  has_one_attached :image

end
