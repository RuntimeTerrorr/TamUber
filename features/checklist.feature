Feature: checklist
    
  Scenario: check all boxes but don't enter vehicle id
    Given I visit the checklist page
    When I check everything off the checklist
    Then I press "Continue"
    Then I should see "Unsuccessful in checking-in becuase not all the checkboxes were checked or vehicle id not entered!"
    
  Scenario: enter vehicle id but don't check all boxes
    Given I visit the checklist page
    When I check "check_tire"
    And I fill in "vehicle_id" with "1"
    Then I press "Continue"
    Then I should see "Unsuccessful in checking-in becuase not all the checkboxes were checked or vehicle id not entered!"
