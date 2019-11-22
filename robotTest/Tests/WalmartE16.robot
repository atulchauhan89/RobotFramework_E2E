*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.walmart.com/ip/440266612  chrome
    sleep  2s
    Click Element  xpath:/html/body/div[1]/div/div[1]/div/div[1]/div/div[2]/div/div/div[3]/div[4]/div[2]/div[1]/div/div/div/div[9]/div/div/div/div[2]/span[2]/div/div[1]/div[2]
    sleep  1s
    Click Element  xpath:/html/body/div[1]/div/div/div[2]/div/div[1]/div/div[1]/div/div/div/div/div[3]/div[5]/div/div[3]/div/div[3]/section/div/div[3]/button/span/span
    sleep  3s
    Click Element  xpath:/html/body/div[2]/div/div[1]/div/div/div[2]/button/span/span
    sleep  1s
    Click Element  xpath:/html/body/div[1]/div/div[1]/div/div[1]/div/div[1]/header/div/div[3]/div/div/div[3]/div/a/div/span[2]
    Wait Until Page Contains  Your cart: 1 item
    Click Element  xpath://*[@id="cart-root-container-content-skip"]/div/div/div[1]/div[2]/div/div/div[2]/div/div/button[1]/span
    Wait Until Page Contains  Sign in
    Input Text  id:sign-in-email  sdodia@walmartlabs.com
    Input Text  xpath:/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[1]/div/div/div/div/div[2]/div/div[1]/div/section/div/section/form/div[2]/div/div[1]/label/div[2]/div/input  urvashi5$
    sleep  2s
    Close Browser

*** Keywords ***
