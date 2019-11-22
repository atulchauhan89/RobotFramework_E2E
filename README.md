# RobotFramework_E2E
This is project is a practise project to automate acceptance test cases with RobotFramework.


# Pre requisite
* Python 3.5
* RobotFramework
* Seleinium
* sqlite3


# Integration with
* Jenkins


# Configuration with jenkins
1) Install jenkins and Robotframework plugin (https://plugins.jenkins.io/robot)
2) Run the below script on Jenkins Console(Can open via Manage Jenkins — Script Console)
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
Result will be ->Result: sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;
Note: Running above code required to view the Robot HTML reports on Jenkins Server
3) Follow this link to know more about complete setup
https://medium.com/dev-blogs/configuring-jenkins-with-github-eef13a5cc9e9
