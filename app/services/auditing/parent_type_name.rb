# frozen_string_literal: true

class Auditing::ParentTypeName
  attr_reader :controller

  def initialize(controller)
    @controller = controller
  end

  def call
    extract_parent_type
  end

  private

  def extract_parent_type
    controller.controller_name.humanize.singularize.titleize
  end
end
