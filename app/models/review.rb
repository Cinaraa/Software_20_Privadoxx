# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
