# RobotFramework_E2E

This project will demo the use of the testing framework [Robotframework](https://robotframework.org/).
In particular the [Selenium Library](https://pypi.org/project/robotframework-seleniumlibrary/) is used for UI testing as well as the [Requests Library](https://pypi.org/project/robotframework-requests/) is used for API testing.
This project also included testcases with Sqlite database.

## Prerequisite to run test suite locally
To run the test suite locally the following needs to be installed:
- Google Chrome
- Chrome Driver
- Python 3
- pip libraries:
  - robotframework
  - robotframework-seleniumlibrary
  - selenium
  - robotframework-requests
  - And what ever else mentioned in the requirement.txt ()

## Execute test locally
* If you want to run particular test suite
robot -d results/sqlite-result tests/Sqlite3_test.robot
* If you want to run particular tag
robot -d results/sqlite-result -i sqlite_db tests
*If you want to run all the test available
robot -d results tests
* If you want to execute test in headless browser
`robot --outputdir=./output-local --variable HEADLESS_BROWSER_ENABLED:False robot-tests`


## Working with the Robotframework
Here are a couple of helpful resources when working with the Robotframework.
- [Official website](http://robotframework.org/)
- [User guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Best practice usage](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)
- [Robotframework Builtin Keyword Definitions](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Keywords)
- [Selenium Library Keyword Definitions](http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Requests Library Keyword Definitions](http://bulkan.github.io/robotframework-requests/)
- [Collection of robotframework-request examples](https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.txt)
