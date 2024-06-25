# frozen_string_literal: true

class Status < ApplicationRecord
  validates_presence_of :name
end
