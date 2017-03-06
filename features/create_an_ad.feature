Feature: Create an ad
  In order to sell an object
  I want to create an ad

  Background: 
    Given a user with id "1"

  Scenario: using valid data
    When the client makes a valid POST /api/v1/ads request with user_id: "1"
    Then response should have status of 200 and JSON:
    """
      {"Message": "Ad created successfully", "id": "1"}
    """

  Scenario: making an ad with no title
    When the client makes a POST /api/v1/ads request with blank title and user_id: "1"
    Then response should have status of 422 and JSON: 
    """
      {"errors:" {"title": ["can't be blank"]}}
    """