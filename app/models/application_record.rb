class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # Stores belongs_to associations name as extra metadata so it can be leveraged for displaying
  has_paper_trail(
    meta: {
      metadata: proc do |model|
        changes = model.saved_changes
        model.class.reflect_on_all_associations(:belongs_to).each_with_object({}) do |assoc, metadata|
          key = "#{assoc.name}_id"
          if changes.key?(key)
            # Asuming the belongs_to association has an atributte called name
            metadata[key] = changes[key].map { |id| id.nil? ? nil : assoc.klass.find(id).name }
          end
        end
      end
    }
  )
end
