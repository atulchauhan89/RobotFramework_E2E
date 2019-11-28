*** Settings ***
Resource  D:/DemoProject/RobotFramework_E2E/end-to-end/Resources/BackOffice/PO/BackOffice.Landing.robot
Resource  D:/DemoProject/RobotFramework_E2E/end-to-end/Resources/BackOffice/PO/BackOffice.TopNav.robot

*** Variables ***

*** Keywords ***
Go to Landing Page
    BackOffice.Landing.Navigate To
    #Landing.Verify Page Loaded