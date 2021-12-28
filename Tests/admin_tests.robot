*** Settings ***

Library     SeleniumLibrary
Library     ../Resources/driver_initiator.py
Resource    ../Resources/pages/login_page.robot
Resource    ../Resources/pages/admin_dashboard_page.robot
Resource    ../Resources/pages/admin_quick_bookings.robot

Suite Setup  Open With Chrome   https://phptravels.net/api/admin
Suite Teardown  Close All Browsers

*** Variables ***
${PASSWORD} =   demoadmin
${DASHBOARD_CONFIRM} =  xpath: //*[text()='DASHBOARD']
${SIDEBAR_ASSERT_TEXT} =    ${SPACE}Dashboard\n My Bookings\n Add Funds\n My Profile\n Logout
${MAIN_MENU_ASSERT_TEXT} =  Home\nHotels\nFlights\nTours\nCars\nVisa\nBlog\nCompany
${WELCOME_ASSERT_TEXT} =    Welcome Back

*** Test Cases ***
Admin URL
    Type Email     admin@phptravels.com
    Type Password  ${PASSWORD}
    Click Login     Dashboard  ${DASHBOARD_CONFIRM}
    Title Should Be     Dashboard

Go To Quick Bookings Page
    Click Bookings Btn
    Click Add Bookings Btn

Book A Hotel
    Select Hotel Service    Hotels
    Select Customer Type    registered
    Customer Email
    Input From Date     03/01/2022
    Input To Date       04/01/2022
    Select Hotel Name   Rendezvous Hotels
    Select Room Type    One-Bedroom Apartment
    Select Number Of Rooms      2
    Total Room Price
    Price For Rooms
    Room Price Type
    Price With VAT
    Price With B2C Markup
    Select Adults       2
    Select Children     2
    Price To Be Paid
    Select Payment Mode     Bank Transfer
    Click Book Now Button
    Is Dashboard Page



















