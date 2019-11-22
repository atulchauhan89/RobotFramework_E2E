*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Load
    Go To  ${HOME_PAGE.${ENV}}

Varify Page Loaded
    Wait Until Page Contains  Shop by Category