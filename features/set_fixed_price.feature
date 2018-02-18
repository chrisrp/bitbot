Feature: Receiving price updates
  When selling overwrite value if it is greater
  When buying overwrite value if it is lower

  Scenario: Receives value greater than current
    Given that I want to "sell"
    Given the current price is 7210.20$
    When an price check of 7310.20$
    Then the current price becomes 7310.20$

  Scenario: Receives value lower than current
    Given that I want to "buy"
    Given the current price is 7210.20$
    When an price check of 7110.20$
    Then the current price becomes 7110.20$
