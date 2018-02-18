Feature: Sell execution
  When current strategy is to sell

  Scenario: Place sell order
    Given that I want to "sell"
    And the buy price was 5000.00$
    And the alert variation is "1.5%"
    And the gain is greater than "2%"
    And the current price is 5200.00$
    When an price check of 5100.00$
    Then an order is placed at 5100.00$
