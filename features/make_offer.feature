Feature: Make an offer
  In order to be able to close a deal
  As a user
  I want to make an offer

  Background:
    Given an ad with id "1"
    And a user with id "2"
  
  Scenario: using valid data
    When I make a valid POST /ads/1/offers with user_id: "2"
    Then response should have status 200 and JSON:
    """
      {"message": "Offer created successfully", "id": 1}
    """

  Scenario: using blank price
    When I make a POST /ads/1/offers request with blank price and user_id: "2"
    Then response should have status 422 and JSON:
    """
      {"errors": {"price": ["can't be blank"]}}
    """