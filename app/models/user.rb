# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :publications
  has_many :requests
  has_one_attached :profilepic
 # enum role: [:client, :moderator, :admin]
  validates :role, inclusion: { in: %w(client moderator),
    message: "%{value} is not a valid role" }

end
