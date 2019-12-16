*** Settings ***
Library        MQTTLibrary
Library        Collections
Test Timeout   30 seconds
#Resource       RobotFramework Projects/RobotFramework_NCQP/TestCases/keywords.robot

*** Variables ***
#${broker.uri}      iot.eclipse.org
${broker.uri}      mqtt.eclipse.org
${broker.port}     1883
${client.id}       test.client
${topic}           test/mqtt_test
${sub.topic}       test/mqtt_test_sub

# Ways to run the test cases
# robot -d result -i MQTT tests
# robot -d results tests

*** Test Cases ***
Publish a single message and disconnect
   [Tags]  MQTT
   #${mqttc}   Connect   ${broker.uri}   ${broker.port}    ${client.id}
   ${time}       Get Time        epoch
   ${message}    Catenate        test message      ${time}
   Publish Single                topic=${topic}    payload=${message}    hostname=${broker.uri}

Publish multiple messages and disconnect
    [Tags]  MQTT
    ${msg1}  Create Dictionary    topic=${topic}     payload=message 1
    ${msg2}  Create Dictionary    topic=${topic}     payload=message 2
    ${msg3}  Create Dictionary    topic=${topic}     payload=message 3
    @{msgs}  Create List          ${msg1}   ${msg2}  ${msg3}
    Publish Multiple              msgs=${msgs}       hostname=${broker.uri}
