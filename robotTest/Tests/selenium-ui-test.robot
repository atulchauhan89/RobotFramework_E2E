*** Settings ***
Documentation  Example test suite using the SeleniumLibrary of the
...            Robotframework.
...            This test suite consists of two test cases filling out two
...            different form and solving a capture.

Library   SeleniumLibrary
Resource  D:/DemoProject/RobotFramework_E2E/robotTest/Resources/selenium-library/Keywords.robot

Test Setup      Initialize
Test Teardown   Close Browser

*** Test Cases ***
User Should Fill The Form 1 Successfully
    [Tags]  SeleniumUI
    GIVEN User fills form 1
    WHEN User submits forms 1
    THEN Form 1 was submitted successfully

User Should Fill The Form 2 Successfully
    [Tags]  SeleniumUI
    GIVEN User fills form 2
    WHEN User submits forms 2
    THEN Form 2 was submitted successfully
