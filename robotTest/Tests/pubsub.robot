*** Settings ***
Resource        D:/DemoProject/RobotFramework_E2E/robotTest/Resources/mqtt-keywords/keywords.robot
Test Timeout    30 seconds


*** Test Cases ***
Publish a non-empty message
    [Tags]  MQTT
    ${time}      Get Time       epoch
    ${message}   Catenate       test message   ${time}
    Publish to MQTT Broker and Disconnect    message=${message}

Publish an empty message
   [Tags]  MQTT
   Publish to MQTT Broker and Disconnect

