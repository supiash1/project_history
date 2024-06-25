# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
%w[Unstarted Started Finished].each do |status_name|
  Status.find_or_create_by(name: status_name)
end

users_attributes = [
  { email: 'alice@example.com',  password: 'password123' },
  { email: 'bob@example.com',  password: 'password123' }
]

users_attributes.each do |user_attr|
  user = User.find_or_create_by(email: user_attr[:email])
  user.assign_attributes(user_attr)
  user.save
end

status_names = %w[Unstarted Started Finished]
statuses = status_names.map do |name|
  Status.find_or_create_by(name:)
end

projects_attributes = [
  { name: 'Project 1', status: statuses[0], comments_attributes: [{ body: 'First comment on Project 1' }] },
  { name: 'Project 2', status: statuses[1], comments_attributes: [{ body: 'First comment on Project 2' }] }
]

projects_attributes.each do |proj_attr|
  project = Project.find_or_create_by(name: proj_attr[:name])
  project.assign_attributes(proj_attr.except(:name))
  project.save
end
