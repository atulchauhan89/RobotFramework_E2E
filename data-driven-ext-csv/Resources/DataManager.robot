*** Settings ***
Documentation  Use this layer to get data from external files
Library  D:/DemoProject/RobotFramework_E2E/data-driven-ext-csv/CustomLibs/Csv.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read csv file  ${FilePath}
    [Return]  ${Data}

