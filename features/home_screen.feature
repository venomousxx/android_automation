@home_screen
Feature: Test for home screen functionality

  @wip
  Scenario: Default values of home screen is Foot and Centimeter
    Given i land on home screen
    Then Left Unit picker value should be "Foot"
    And Right Unit picker value should be "Centimeter"

  @wop
  Scenario: Show all button should be enabled at launch
    Given i land on home screen
    Then Show all button should be disabled
    When i type "1" on application keyboard
    Then Show all button should be enabled

  @scenario6
  Scenario Outline: verify deafult conversion
    Given i land on home screen
    And i wait for 3 seconds
    Then convertion unit must be "Length" 
    When i type "<target>" on application keyboard
    Then i should see result as "<result>"
  Examples:
    |target |result    |
    |1      |30.48     |
    |2      |60.96     |
    |10      |304.8    |
    |15      |457.2    |

  @scenario3
  Scenario: user able to add current conversion to favorite list
    Given i open app for the first time
    And i land on home screen
    Then i press on favorite icon
    When i press on menu icon
    Then i press favorite conversions
    And i verify "length" added to favorite conversions list

  @scenario5
  Scenario: User able to search by existing conversion type
    Given i land on home screen
    Then i press on search icon
    And i wait for 5 seconds
    Then i type "Area" in search field
    And i press return button on soft keyboard
    And i wait for 5 seconds
    Then i should see "Area" as a current unit converter
    Then  Left Unit picker value should be "Hectare"
    And Right Unit picker value should be "Square meter"
