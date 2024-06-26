class Project < ApplicationRecord
  belongs_to :status
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank
  default_scope { order(name: :asc) }

  def history = PaperTrail::Version.where(parent_type: self.class.name, parent_id: id)
end
