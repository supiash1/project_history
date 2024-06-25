class Project < ApplicationRecord
  belongs_to :status
  validates_presence_of :name
end
