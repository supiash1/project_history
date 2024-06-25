# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def info_for_paper_trail
    { email: user.email, parent_type: Auditing::ParentTypeName.new(self).call,
      parent_event: self.class.authority_action_map[action_name.to_sym]&.capitalize,
      parent_id: params[:id] }
  end
end
