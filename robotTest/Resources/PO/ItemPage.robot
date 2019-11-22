*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Load
    Go To  ${ITEM_PAGE}

Varify Page Loaded
    Wait Until Page Contains  Great Value Taco Seasoning Mix, Original