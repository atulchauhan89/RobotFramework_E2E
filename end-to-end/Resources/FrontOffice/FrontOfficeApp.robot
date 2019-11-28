*** Settings ***
Resource  D:/DemoProject/RobotFramework_E2E/end-to-end/Resources/FrontOffice/PO/FrontOffice.Landing.robot
Resource  D:/DemoProject/RobotFramework_E2E/end-to-end/Resources/FrontOffice/PO/FrontOffice.TopNav.robot
Resource  D:/DemoProject/RobotFramework_E2E/end-to-end/Resources/FrontOffice/PO/FrontOffice.Team.robot

*** Variables ***

*** Keywords ***
Go to Landing Page
    FrontOffice.Landing.Navigate To
    FrontOffice.Landing.Verify Page Loaded

Go to "Team" Page
    FrontOffice.TopNav.Select "Team" Page
    FrontOffice.Team.Verify Page Loaded

Validate "Team" Page
    FrontOffice.Team.Validate Page Contents