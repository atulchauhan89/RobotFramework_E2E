*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  /Users/sdodia/PycharmProjects/Automation/data-driven-ext-csv/Data/InputData.robot
Resource  /Users/sdodia/PycharmProjects/Automation/data-driven-ext-csv/Resources/Common.robot
Resource  /Users/sdodia/PycharmProjects/Automation/data-driven-ext-csv/Resources/CarsApp.robot
Resource  /Users/sdodia/PycharmProjects/Automation/data-driven-ext-csv/Resources/DataManager.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/Cars.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid logins
    ${InvalidLoginScenarios} =   DataManager.Get CSV Data  ${INVALID_CREDENTIALS_PATH_CSV}
    CarsApp.Login with many invalid credentials  ${InvalidLoginScenarios}

#Unregistered user should see correct error message at login
#    CarsApp.Navigate to Sign In Page
#    CarsApp.Attempt Login  ${UNREGISTERED_USER}
#    CarsApp.Verify Login Page Error Message  ${UNREGISTERED_USER.ExpectedErrorMessage}
#
#Login with invalid password should show correct error message
#    CarsApp.Navigate to Sign In Page
#    CarsApp.Attempt Login  ${INVALID_PASSWORD_USER}
#    CarsApp.Verify Login Page Error Message  ${INVALID_PASSWORD_USER.ExpectedErrorMessage}
#
#Login with blank email and password should show correct error message
#    CarsApp.Navigate to Sign In Page
#    CarsApp.Attempt Login  ${BLANK_CREDENTIALS_USER}
#    CarsApp.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}