Feature: Edit Project

  Scenario: Edit a project's status and add a comment
    Given I am logged in as a user
      And I am on the projects page
      And I have a project named "Project A" with status "Started"
    When I go to the edit page for "Project A"
      And I select "Finished" from "Status"
      And I fill in "Body" with "This project is now finished."
      And I press "Update Project"
    Then I should see "Project A" with status "Finished"
      And I should see "This project is now finished." in comments
