Feature: Create an ad
  In order to sell an object
  I want to create an ad

  Background:
    Given a user with id "1"

  Scenario: using valid data
    When I make a valid POST /ads request with user_id: "1"
    Then response should have status 200 and JSON:
    """
      {"message": "Ad created successfully", "id": 1}
    """

  Scenario: using blank title
    When I make a POST /ads request with blank title and user_id: "1"
    Then response should have status 422 and JSON:
    """
      {"errors": {"title": ["can't be blank"]}}
    """