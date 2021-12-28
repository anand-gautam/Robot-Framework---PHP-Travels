*** Settings ***
Library     SeleniumLibrary
Library     ./Resources/driver_initiator.py


*** Variables ***
${BOOKINS_BTN} =    xpath: //button[@type='submit']//*[contains(text(), 'Bookings')]
${ADD_BOOKINGS_BTN} =   xpath: //*[contains(text(), 'Add Booking')]
${QUICK_BOOKING_TEXT} =     xpath: //*[text()='Quick Booking']


*** Keywords ***
Click Bookings Btn
    Click Element   ${BOOKINS_BTN}
    Wait Until Element Is Visible   ${ADD_BOOKINGS_BTN}     15

Click Add Bookings Btn
    Click Element   ${ADD_BOOKINGS_BTN}
    Wait Until Element Is Visible   ${QUICK_BOOKING_TEXT}     15