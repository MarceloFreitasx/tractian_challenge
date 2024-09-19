Feature: Asset Page
As a user,
I want to visualize the company's asset hierarchy
So that I can easily identify and access specific assets.

Scenario: Display asset tree
Given I am on the asset page
Then I should see a visual representation of the asset hierarchy.

Scenario: Filter assets by text search
Given I am on the asset page
When I enter a search term in the search bar
Then the asset tree should be filtered to show only items that match the search term.

Scenario: Filter assets by energy sensors
Given I am on the asset page
When I apply the "Energy Sensors" filter
Then only energy sensors should be visible in the asset tree.

Scenario: Filter assets by critical sensor status
Given I am on the asset page
When I apply the "Critical Sensor Status" filter
Then only assets with critical sensor status should be visible in the asset tree.

Scenario: Prevent hiding parent assets when filters are applied
Given I am on the asset page with filters applied
When I collapse a parent asset
Then the parent asset should remain visible.

Scenario: Hide unrelated assets when filters are applied
Given I am on the asset page with filters applied
When I expand a parent asset
Then only child assets that match the filters should be visible.