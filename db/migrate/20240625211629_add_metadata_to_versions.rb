class AddMetadataToVersions < ActiveRecord::Migration[7.1]
  def change
    add_column :versions, :parent_type, :string
    add_column :versions, :parent_event, :string
    add_column :versions, :email, :string
    add_column :versions, :parent_id, :integer
  end
end
