Feature: Retrieve ads

  Scenario: Retrieve ads
    Given following ads:
      | id | title                | description                                 | price |
      | 1  | Old computer to sell | I'm selling my computer as it's getting old | 125   |
      | 2  | Give away my camera  | To the one making the best offer            | 0     |
    When I make a GET /ads
    Then response should have status 200 and JSON:
    """
    [{ "id": 1, "title": "Old computer to sell", "description": "I'm selling my computer as it's getting old", "price": 125 },
     { "id": 2, "title": "Give away my camera", "description": "To the one making the best offer", "price": 0 }]
    """