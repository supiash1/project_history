# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_paper_trail_whodunnit

  DEFAULT_CONTROLLER_ACTIONS = {
    index: 'read',
    show: 'read',
    new: 'create',
    create: 'create',
    edit: 'update',
    update: 'update',
    destroy: 'delete'
  }.freeze

  def info_for_paper_trail
    { email: current_user&.email, parent_type: Auditing::ParentTypeName.new(self).call,
      parent_event: DEFAULT_CONTROLLER_ACTIONS[action_name.to_sym]&.capitalize,
      parent_id: params[:id] }
  end
end
