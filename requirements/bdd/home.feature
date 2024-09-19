Feature: Home Page
As a user,
I want to view a list of companies
So that I can access their assets.

Scenario: Display a list of companies
Given I am on the home screen
Then I should see a list of companies.

Scenario: Navigate to a specific company's assets page
Given I am on the home screen
When I tap on a specific company in the list
Then I should be navigated to the company's assets page.