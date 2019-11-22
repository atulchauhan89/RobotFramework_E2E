*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

End of Test
    Close Browser

Insert Testing Data
    Log  I am inserting test data....

Cleanup Testing Data
    Log  I am deleting test data....

