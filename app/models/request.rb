# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :publication
  belongs_to :user
end
