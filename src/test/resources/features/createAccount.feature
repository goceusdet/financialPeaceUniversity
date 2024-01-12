Feature: Create Account
  As a user I want to create a Ramsey Solutions account in order to have access to the LMS.

  Background: User navigates to Financial Peace University page
    Given user navigates to Financial Peace University page
    And user clicks on "Sign In" link


  Scenario Outline: Verify user can successfully create a Ramsey Solutions account by entering valid credentials.
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters valid "<password>"
    And user clicks on "Create Account" button
    Then user initials should be displayed on the user menu button

    Examples:
      | email              | password     |
      | gocesdet@gmail.com | UserUser@123 |


  Scenario Outline: Verify user can NOT create a Ramsey Solutions account by entering existing account's email and empty password
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user clicks on "Create Account" button
    Then user should see a warning "<message>" under password field
    And user should still be on the Create Account page

    Examples:
      | email              | message                     |
      | gocesdet@gmail.com | Please enter your password. |


  Scenario Outline: Verify user can NOT create a Ramsey Solutions account by entering existing account's email and password
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters valid "<password>"
    And user clicks on "Create Account" button
    Then user should see a warning "<message>"
    And user should still be on the Create Account page

    Examples:
      | email              | password     | message                                                                                                       |
      | gocesdet@gmail.com | UserUser@123 | We weren't able to create your account. Sign in (see link below) with an existing account or try again later. |


  Scenario Outline: Verify user can NOT create a Ramsey Solutions account by entering existing account's email and invalid password containing less than 12 characters
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters invalid "<password>"
    And user clicks on "Create Account" button
    Then user should see a warning "<message>"
    And user should see another warning "<warningMsg>"
    And user should still be on the Create Account page

    Examples:
      | email              | password    | message             | warningMsg                               |
      | gocesdet@gmail.com | U           | Password is invalid | Must be at least 12 characters in length |
      | gocesdet@gmail.com | User@       | Password is invalid | Must be at least 12 characters in length |
      | gocesdet@gmail.com | UserUser@11 | Password is invalid | Must be at least 12 characters in length |


  Scenario Outline: Verify user can NOT create a Ramsey Solutions account by entering existing account's email and invalid password containing more than 12 characters
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters invalid "<password>"
    And user clicks on "Create Account" button
    Then user should see a warning "<message>"
    And user should still be on the Create Account page

    Examples:
      | email              | password            | message                                                                                                       |
      | gocesdet@gmail.com | 123Goce123456Ramsey | We weren't able to create your account. Sign in (see link below) with an existing account or try again later. |


# Scenario Outline: Verify user can NOT create a Ramsey Solutions account by not entering any credentials

    #valid email & invalid pass

   #invalid email and valid pass