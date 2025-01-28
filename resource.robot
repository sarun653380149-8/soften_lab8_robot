*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
# ${BROWSER}        Chrome
${DELAY}          0.1
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${FORM URL}     http://${SERVER}/Form.html
${COMPLETE URL}     http://${SERVER}/Complete.html

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${LOGIN URL}
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page




# ----------------------------------------------------------- lab7.2 ---------------------------------------------------------------#

Open Browser To Form Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${chrome_options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Set Selenium Speed    ${DELAY}
    Go To   ${FORM URL}

Input FirstName
    [Arguments]    ${firstname}
    Input Text    id:firstname    ${firstname}

Input LastName
    [Arguments]    ${lastname}
    Input Text    id:lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    id:destination    ${destination}

Input Contactperson
    [Arguments]    ${contactperson}
    Input Text    id:contactperson    ${contactperson}
Input Relationship
    [Arguments]    ${relationship}
    Input Text    id:relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    id:phone    ${phone}

Click SubmitButton
    Click Element    xpath=//input[@type='submit' and @id='submitButton']

Welcome Page Should Be Open Complete
    Title Should Be    Completed