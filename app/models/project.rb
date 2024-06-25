class Project < ApplicationRecord
  belongs_to :status
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true
end
