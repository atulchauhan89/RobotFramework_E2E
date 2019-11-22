*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/Walmart.robot
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/Common.robot
Suite Setup  Insert Testing Data
Test Setup  Begin Web Test
Test Teardown  End of Test
Suite Teardown  Cleanup Testing Data

*** Variables ***
${ENV} =  stg
${BROWSER} =   Chrome
${ITEM_PAGE} =  http://www.walmart.com/ip/440266612
&{HOME_PAGE}    prod=http://www.walmart.com/  stg=http://www-e16.walmart.com/  qa=http://www-e4.walmart.com/
${SEARCH_TERM} =  bike
#More dictionary variables examples
&{CUSTOMER_USER}  FirstName=Bryan  LastName=Lamb  Dob=1/1/1900  Email=bryan@robotframework.com  Password=MyPassword!
&{ADMIN_USER}  FirstName=Joe  LastName=Smith  Dob=1/1/1900  Email=admin@robotframework.com  Password=AdminPassword!

*** Test Cases ***
Go To Item Page and few checks
    [Documentation]  This is some basic info about the test
    [Tags]  Current
    Walmart.Go to Item Page and select varient

Search basic use case
    [Tags]  Search
    Walmart.Search from Home Page
    Do Some Custom Things



User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Walmart.Go to Item Page and select varient
    Walmart.Add to Cart and Go to Checkout
    Walmart.Enter Username & password

