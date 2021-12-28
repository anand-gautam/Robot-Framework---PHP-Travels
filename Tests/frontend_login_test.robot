*** Settings ***

Library     SeleniumLibrary
Library     ../Resources/driver_initiator.py
Resource    ../Resources/pages/login_page.robot
Resource    ../Resources/pages/dashboard_page.robot
Suite Setup  Open With Chrome   https://www.phptravels.net/login
Suite Teardown  Close All Browsers

*** Variables ***
${PASSWORD} =   demouser
${DASHBOARDCONFIRM} =   xpath: //*[@class='page-active']//*[contains(text(), 'Dashboard')]
${SIDEBAR_ASSERT_TEXT} =    ${SPACE}Dashboard\n My Bookings\n Add Funds\n My Profile\n Logout
${MAIN_MENU_ASSERT_TEXT} =  Home\nHotels\nFlights\nTours\nCars\nVisa\nBlog\nCompany
${WELCOME_ASSERT_TEXT} =    Welcome Back

*** Test Cases ***
Front End URL
#    Open With Chrome
    Type Email     user@phptravels.com
    Type Password  ${PASSWORD}
    Click Login     Dashboard   ${DASHBOARDCONFIRM}
    Title Should Be     Dashboard - PHPTRAVELS


Dashboard Page Assert
    Get SideBar Items Text  ${SIDEBAR_ASSERT_TEXT}
    Get Main Menu Text      ${MAIN_MENU_ASSERT_TEXT}
    Get Welcome Text        ${WELCOME_ASSERT_TEXT}











