*** Settings ***
Documentation  Talk about what this suite of tests does
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Resources/BackOffice/BackOfficeApp.robot
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Resources/Common/CommonWeb.robot
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Data/InputData.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results tests/BackOffice/Back_Office.robot

*** Test Cases ***
Should be able to access "Landing" page
    [Documentation]  This is test 1
    [Tags]  test1
    BackOfficeApp.Go to Landing Page