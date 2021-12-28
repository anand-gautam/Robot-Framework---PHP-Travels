*** Settings ***
Library     SeleniumLibrary
Library     ./Resources/driver_initiator.py

*** Variables ***
${URL} =    https://www.phptravels.net/login
${CHROME} =     Chrome
${FIREFOX} =    Firefox
${USEREMAIL} =  name: email
${USERPASS} =   name: password
${LOGINBTN} =   xpath: //*[@type='submit']//*[text()='Login']


*** Keywords ***
Open With Chrome
    [Arguments]  ${url}
    ${driver} =     driver_initiator.Getchrome
    log     ${driver}
    Open Browser    ${url}  ${CHROME}  executable_path=${driver}
    Maximize Browser Window
#    close all browsers

Open With Firefox
    [Arguments]  ${url}
    ${driver} =     driver_initiator.Getff
    log     ${driver}
    Open Browser    ${url}  ${FIREFOX}  executable_path=${driver}
    Maximize Browser Window
#    close all browsers

Type Email
    [Arguments]     ${useremailid}
    input text  ${USEREMAIL}  ${useremailid}

Type Password
    [Arguments]     ${userpw}
    input password  ${USERPASS}     ${userpw}

Click Login
    [Arguments]  ${text_assert}     ${next_page}
    Click Element   ${LOGINBTN}
    Wait Until Element Is Visible   ${next_page}
    Page Should Contain      ${text_assert}

Close Browsers
    Close All Browsers




