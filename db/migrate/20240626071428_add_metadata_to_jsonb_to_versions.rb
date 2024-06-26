class AddMetadataToJsonbToVersions < ActiveRecord::Migration[7.1]
  def change
    add_column :versions, :metadata, :jsonb
  end
end
