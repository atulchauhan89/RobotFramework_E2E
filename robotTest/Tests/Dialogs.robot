*** Settings ***
Documentation  These are some web tests
Library  Dialogs
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/Walmart.robot
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/Common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End of Test

# robot -d results/dialogs tests/dialogs.robot

*** Variables ***
${BROWSER} =   Chrome
${ITEM_PAGE} =  http://www.walmart.com/ip/440266612

*** Test Cases ***
Go To Item Page and few checks
    [Documentation]  This is some basic info about the test
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Which browser?  chrome  ie  firefox
    Set Global Variable  ${BROWSER}  ${new_browser}
    Walmart.Go to Item Page and select varient

User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Web
    Walmart.Go to Item Page and select varient
    Execute Manual Step  Do something manually!  It failed!
    Walmart.Add to Cart and Go to Checkout
    Pause Execution
    Walmart.Enter Username & password