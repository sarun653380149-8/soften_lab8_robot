*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOMEPAGE}    http://www.google.com
${BROWSER}     Chrome

*** Test Cases ***
Go To Homepage
    Open Browser    ${HOMEPAGE}    ${BROWSER}
