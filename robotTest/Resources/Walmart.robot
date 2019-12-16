*** Settings ***
Library  SeleniumLibrary
Library  D:/DemoProject/RobotFramework_E2E/robotTest/Libraries/MyCustomLibrary.py
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/PO/ItemPage.robot
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/PO/HomePage.robot
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/PO/TopNav.robot

*** Keywords ***
Do Some Custom Things
    Do Something Special

Go to Item Page and select varient
    ItemPage.Load
    ItemPage.Varify Page Loaded
    Wait Until Page Contains  Great Value Taco Seasoning Mix, Original
    Click Element  xpath://*[@id="variants-section"]/div/div[2]/label[2]/div[1]/div[2]
    sleep  1s

Add to Cart and Go to Checkout
    Click Element  xpath://*[@id="variants-section"]/div/div[2]/label[1]/div[1]/div[2]
    sleep  2s
    Click Element  xpath:/html/body/div[1]/div/div/div[2]/div/div[1]/div/div[1]/div/div/div/div/div[3]/div[5]/div/div[3]/div/div[3]/section/div[1]/div[3]/button/span/span
    sleep  1s
    Click Element  xpath:/html/body/div[1]/div/div[1]/div/div[1]/div/div[1]/header/div/div[3]/div/div/div[3]/div/a/div/span[2]
    Wait Until Page Contains  Your cart: 1 item
    Click Element  xpath://*[@id="cart-root-container-content-skip"]/div/div/div[2]/div[2]/div/div/div[2]/div/div/button[1]
    Wait Until Page Contains  Sign in

Enter Username & password
    Input Text  id:sign-in-email  sdodia@walmartlabs.com
    Input Text  xpath:/html/body/div[1]/div/div[1]/div/div[1]/div[3]/div/div/div/div[1]/div/div/div/div/div[2]/div/div[1]/div/section/div/section/form/div[2]/div/div[1]/label/div[2]/div/input  urvashi5$
    sleep  2s

Search from Home Page
    HomePage.Load
    HomePage.Varify Page Loaded
    TopNav.Search for Products
    ${ReturnedInfo} =  Wait Until Page Contains  Bike Care Plans
    Log  ${ReturnedInfo}