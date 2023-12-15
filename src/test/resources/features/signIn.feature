Feature: Sign In feature
  As a user I want to successfully sign in to my Financial Peace University account

  Background: User navigates to Financial Peace University page
    Given user navigates to Financial Peace University page
    And user clicks on "Sign In" link


  Scenario Outline: Verify user can successfully sign in to FPU account with valid credentials
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters valid "<password>"
    And user clicks the "Sign In" button
    Then user initials should be displayed on the user menu button

    Examples:
      | email              | password     |
      | gocesdet@gmail.com | UserUser@123 |


  Scenario Outline: Verify user can NOT successfully sign in by not entering any credentials
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user leaves empty "email" field
    And user leaves empty "password" field
    And user clicks the "Sign In" button
    Then user should see "<emailWarningMsg>" under email field
    And user should see "<passwordWarningMsg>" under email field
    And user should stay on "Sign In" page

    Examples:
      | emailWarningMsg      | passwordWarningMsg          |
      | Email can't be blank | Please enter your password. |


  Scenario Outline: Verify user can NOT successfully sign in by entering invalid email and invalid password
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters invalid "<email>"
    And user enters invalid "<password>"
    And user clicks the "Sign In" button
    Then user should see "<emailWarningMsg>" under email field
    And user should stay on "Sign In" page

    Examples:
      | email              | password   | emailWarningMsg  |
      | gocesdetgmail.com  | U          | Email is invalid |
      | gocesdet@          | UserU      | Email is invalid |
      | gocesdet           | UserUser@  | Email is invalid |
      | gocesdet.gmail.com | UserUser@1 | Email is invalid |


  Scenario Outline: Verify user can NOT successfully sign in by entering valid email and invalid password
     #Given user navigates to Financial Peace University page
     #And user clicks on "Sign In" link
    When user enters valid "<email>"
    And user enters invalid "<password>"
    And user clicks the "Sign In" button
    Then user should see "<warningMsg>" above email field
    And user should stay on "Sign In" page

    Examples:
      | email              | password   | warningMsg                                                                                  |
      | gocesdet@gmail.com | U          | We weren't able to sign you in.  Double-check your email and password, or sign in with SSO. |
      | gocesdet@gmail.com | UserU      | We weren't able to sign you in.  Double-check your email and password, or sign in with SSO. |
      | gocesdet@gmail.com | UserUser@  | We weren't able to sign you in.  Double-check your email and password, or sign in with SSO. |
      | gocesdet@gmail.com | UserUser@1 | We weren't able to sign you in.  Double-check your email and password, or sign in with SSO. |


  Scenario Outline: Verify user can NOT successfully sign in by entering invalid email and valid password
    #Given user navigates to Financial Peace University page
    #And user clicks on "Sign In" link
    When user enters invalid "<email>"
    And user enters valid "<password>"
    And user clicks the "Sign In" button
    Then user should see "<emailWarningMsg>" under email field
    And user should stay on "Sign In" page

    Examples:
      | email              | password     | emailWarningMsg  |
      | gocesdetgmail.com  | UserUser@123 | Email is invalid |
      | gocesdet@          | UserUser@123 | Email is invalid |
      | gocesdet           | UserUser@123 | Email is invalid |
      | gocesdet.gmail.com | UserUser@123 | Email is invalid |