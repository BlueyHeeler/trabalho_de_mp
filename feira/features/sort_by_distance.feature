Feature: Sort shopping tables by distance
    As an user
    I want to sort the shopping tables by distance
    So that I can find the closest shopping options

    Scenario: User sorts shopping tables by distance
        Given I am on the "feira" page
        When I click on the "Sort by Distance" option
        Then the shopping tables should be displayed in ascending order by distance

    Scenario: User views distance information
        Given I am on the "feira" page
        Then each shopping table should display its distance from my location

