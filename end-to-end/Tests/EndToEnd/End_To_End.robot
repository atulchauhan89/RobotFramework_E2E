*** Settings ***
Documentation  This is my end to end suite
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Resources/BackOffice/BackOfficeApp.robot
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Resources/FrontOffice/FrontOfficeApp.robot
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Resources/Common/CommonWeb.robot
Resource  /Users/sdodia/PycharmProjects/Automation/end-to-end/Data/InputData.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results tests/EndToEnd/End_To_End.robot

*** Test Cases ***
Should be able to access both sites
    [Documentation]  This is test 1
    [Tags]  test1
    FrontOfficeApp.Go to Landing Page
    BackOfficeApp.Go to Landing Page