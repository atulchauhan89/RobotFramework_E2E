*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary

*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
    Input Text  id=global-search-input  ${SEARCH_TERM}  #//*[@id="global-search-input"]

Submit Search
    Click Element  xpath=//*[@id="global-search-form"]/div/div[3]/div/button/span/span
