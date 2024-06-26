module ControllerActions
  extend ActiveSupport::Concern

  DEFAULT_CONTROLLER_ACTIONS = {
    index: 'read',
    show: 'read',
    new: 'create',
    create: 'create',
    edit: 'update',
    update: 'update',
    destroy: 'delete'
  }.freeze
end
