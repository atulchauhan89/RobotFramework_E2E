*** Settings ***
Resource  D:/DemoProject/RobotFramework_E2E/data-driven-builtin-my/Resources/PO/SignIn.robot

*** Keywords ***
Test Multiple Login Scenrios
    [Arguments]  ${Credentials}
    Navigate to Sign In Page
    Attempt Login   ${Credentials}
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}

Navigate to Sign In Page
    SignIn.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    SignIn.Enter Credentials  ${Credentials}
    SignIn.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignIn.Verify Error Message  ${ExpectedErrorMessage}