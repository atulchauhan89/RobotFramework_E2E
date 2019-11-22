*** Settings ***
Documentation    Database suite for Sqlite database with multiple examples
Library           DatabaseLibrary
Library           OperatingSystem



# Many ways to run:
# robot -d results/sqlite-result tests/Sqlite3_test.robot
# robot -d results/sqlite-result -i sqlite_db tests
# robot -d results tests


*** Variables ***
${DBName}         my_db_test
${DBlocation}     D:/DemoProject/RobotFramework_E2E/robotTest/Resources/DB/my_db_test_insertData.sql

*** Test Cases ***
Remove old DB if exists
    [Tags]    sqlite_db
    ${Status}    ${value} =    Run Keyword And Ignore Error    File Should Not Exist    ./${DBName}.db
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword And Ignore Error    Remove File    ./${DBName}.db
    File Should Not Exist    ./${DBName}.db
    Comment    Sleep    1s

Connect to SQLiteDB
    [Tags]    sqlite_db
    Comment    Connect To Database Using Custom Params sqlite3 database='D:\DemoProject\RobotFramework_E2E\robotTest\Resources\DB\my_db_test.db'
    Connect To Database Using Custom Params    sqlite3    database="./${DBName}.db", isolation_level=None

Create person table
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar,last_name varchar);
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Execute SQL Script - Insert Data person table
    [Tags]    sqlite_db
    ${output} =    Execute SQL Script    ${DBlocation}
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Execute SQL String - Create Table
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    create table foobar (id integer primary key, firstname varchar unique)
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Check If Exists In DB - Atul Singh
    [Tags]    sqlite_db
    Check If Exists In Database    SELECT id FROM person WHERE first_name = 'Atul';

Check If Not Exists In DB - Joe
    [Tags]    sqlite_db
    Check If Not Exists In Database    SELECT id FROM person WHERE first_name = 'Joe';

Table Must Exist - person
    [Tags]    sqlite_db
    Table Must Exist    person

Verify Row Count is 0
    [Tags]    sqlite_db
    Row Count is 0    SELECT * FROM person WHERE first_name = 'NotHere';

Verify Row Count is Equal to X
    [Tags]    sqlite_db
    Row Count is Equal to X    SELECT id FROM person;    2

Verify Row Count is Less Than X
    [Tags]    sqlite_db
    Row Count is Less Than X    SELECT id FROM person;    3

Verify Row Count is Greater Than X
    [Tags]    sqlite_db
    Row Count is Greater Than X    SELECT * FROM person;    1

Retrieve Row Count
    [Tags]    sqlite_db
    ${output} =    Row Count    SELECT id FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    2

Retrieve records from person table
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    SELECT * FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify person Description
    [Tags]    sqlite_db
    Comment    Query db for table column descriptions
    @{queryResults} =    Description    SELECT * FROM person LIMIT 1;
    Log Many    @{queryResults}
    ${output} =    Set Variable    ${queryResults[0]}
    Should Be Equal As Strings    ${output}    ('id', None, None, None, None, None, None)
    ${output} =    Set Variable    ${queryResults[1]}
    Should Be Equal As Strings    ${output}    ('first_name', None, None, None, None, None, None)
    ${output} =    Set Variable    ${queryResults[2]}
    Should Be Equal As Strings    ${output}    ('last_name', None, None, None, None, None, None)
    ${NumColumns} =    Get Length    ${queryResults}
    Should Be Equal As Integers    ${NumColumns}    3

Verify foobar Description
    [Tags]    sqlite_db
    Comment    Query db for table column descriptions
    @{queryResults} =    Description    SELECT * FROM foobar LIMIT 1;
    Log Many    @{queryResults}
    ${output} =    Set Variable    ${queryResults[0]}
    Should Be Equal As Strings    ${output}    ('id', None, None, None, None, None, None)
    ${output} =    Set Variable    ${queryResults[1]}
    Should Be Equal As Strings    ${output}    ('firstname', None, None, None, None, None, None)
    ${NumColumns} =    Get Length    ${queryResults}
    Should Be Equal As Integers    ${NumColumns}    2

Verify Query - Row Count person table
    [Tags]    sqlite_db
    ${output} =    Query    SELECT COUNT(*) FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    [(2,)]

Verify Query - Row Count foobar table
    [Tags]    sqlite_db
    ${output} =    Query    SELECT COUNT(*) FROM foobar;
    Log    ${output}
    Should Be Equal As Strings    ${output}    [(0,)]

Verify Query - Get results as a list of dictionaries
    [Tags]    sqlite_db
    ${output} =    Query    SELECT * FROM person;    \    True
    Log    ${output}
    Should Be Equal As Strings    &{output[0]}[first_name]    Atul
    Should Be Equal As Strings    &{output[1]}[first_name]    Jerry

Verify Execute SQL String - Row Count person table
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    SELECT COUNT(*) FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify Execute SQL String - Row Count foobar table
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    SELECT COUNT(*) FROM foobar;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Insert Data Into Table foobar
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    INSERT INTO foobar VALUES(1,'Jerry');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify Query - Row Count foobar table 1 row
    [Tags]    sqlite_db
    ${output} =    Query    SELECT COUNT(*) FROM foobar;
    Log    ${output}
    Should Be Equal As Strings    ${output}    [(1,)]

Verify Delete All Rows From Table - foobar
    [Tags]    sqlite_db
    Delete All Rows From Table    foobar
    Comment    Sleep    2s

Verify Query - Row Count foobar table 0 row
    [Tags]    sqlite_db
    Row Count Is 0    SELECT * FROM foobar;

Begin first transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    SAVEPOINT first    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Add person in first transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    INSERT INTO person VALUES(101,'Bilbo','Baggins');    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify person in first transaction
    [Tags]    sqlite_db
    Row Count is Equal to X    SELECT * FROM person WHERE last_name = 'Baggins';    1    True

Begin second transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    SAVEPOINT second    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Add person in second transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    INSERT INTO person VALUES(102,'Frodo','Baggins');    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify persons in first and second transactions
    [Tags]    sqlite_db
    Row Count is Equal to X    SELECT * FROM person WHERE last_name = 'Baggins';    2    True

Rollback second transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    ROLLBACK TO SAVEPOINT second    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify second transaction rollback
    [Tags]    sqlite_db
    Row Count is Equal to X    SELECT * FROM person WHERE last_name = 'Baggins';    1    True

Rollback first transaction
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    ROLLBACK TO SAVEPOINT first    True
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Verify first transaction rollback
    [Tags]    sqlite_db
    Row Count is 0    SELECT * FROM person WHERE last_name = 'Baggins';    True

Drop person and foobar tables
    [Tags]    sqlite_db
    ${output} =    Execute SQL String    DROP TABLE IF EXISTS person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
    ${output} =    Execute SQL String    DROP TABLE IF EXISTS foobar;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

*** Keywords ***
Provided precondition
    Setup system under test