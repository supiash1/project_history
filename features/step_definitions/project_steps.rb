Given('I am logged in as a user') do
  user = User.find_or_create_by(email: 'user@example.com') do |user|
    user.password = 'password'
  end
  login_as(user, scope: :user)
end

Given('I am on the projects page') do
  visit projects_path
end

Given('I have a project named {string} with status {string}') do |name, status|
  Project.create(name:, status: Status.find_by(name: status))
end

When('I go to the edit page for {string}') do |name|
  project = Project.find_by(name:)
  visit edit_project_path(project)
end

When('I select {string} from {string}') do |option, select_box|
  select(option, from: select_box)
end

When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

When('I press {string}') do |button_name|
  click_button(button_name)
end

Then('I should see {string} with status {string}') do |name, status|
  @project = Project.find_by(name:)
  expect(@project.status.name).to eq(status)
end

Then('I should see {string} in comments') do |comment_text|
  expect(@project.comments.last.body).to eq(comment_text)
end
