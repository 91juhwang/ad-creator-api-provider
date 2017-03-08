Feature: Retrieve offers

  Scenario: Retrieve offers
    Given an ad with id "1"
    Given following users:
      | id |
      | 2  |
      | 3  |
      | 4  |
    And following offers:
      | id | message                    | price | ad_id | user_id |
      | 1  | Exactly what I need !      | 500   | 1     | 2       |
      | 2  | Would you lower the price? | 25    | 1     | 3       |
      | 3  |                            | 75    | 1     | 4       |
    When I make a GET /ads/1/offers
    Then response should have status 200 and JSON:
    """
    [{ "id": 1, "message": "Exactly what I need !", "price": 500, "user_id": 2 },
    { "id": 3, "message": "", "price": 75, "user_id": 4 },
    { "id": 2, "message": "Would you lower the price?", "price": 25, "user_id": 3}]
    """