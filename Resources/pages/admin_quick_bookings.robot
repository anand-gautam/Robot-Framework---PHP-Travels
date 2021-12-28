*** Settings ***
Library     SeleniumLibrary
Library     ./Resources/driver_initiator.py

*** Variables ***
${SERVICE_TYPE} =       id: servicetype
${CUSTOMER_TYPE} =      id: selusertype
${CUSTOMER_EMAIL} =     class: select2-chosen
${FROM_DATE} =      xpath: //*[contains(@class, 'checkinlabel')]//*[@id='Hotels']
${LBL_CHECKOUT} =   xpath: //*[text()='Check-Out ']
${TO_DATE} =      xpath: //*[@class='form-group']//*[@name='checkout']
${SELECT_HOTEL} =   xpath: //*[text()='Hotel Name']/..//select
${SELECT_ROOM} =    xpath: //*[text()='Room Name']/..//select
${ROOM_COUNT} =     xpath: //select[@name='roomscount']
${TOTAL_ROOM_PRICE} =   "totalroomprice"
${PRICE_PER_NIGHT} =    "roomtotal"
${PRICE_TYPE} =     "price_type"
${VAT_TAX} =        "taxhotel"
${B2C_MARKUP_PCT} =     "b2c_markup"
${TOTAL_ADULTS} =   id: adultscount
${TOTAL_CHILDREN} =   id: childcount
${DEPOSIT_AMT} =   "totaltopay"
${PAYMENT_METHOD} =   xpath: //*[@name='paymethod']
${BTN_BOOK_NOW} =   xpath: //*[@value='Book Now']
${BOOKINGS_VIEW_PAGE} =   xpath: //div[text()='Bookings View']



*** Keywords ***

Select Hotel Service
    [Arguments]  ${hotel}
    Select From List By Value     ${SERVICE_TYPE}   ${hotel}

Select Customer Type
    [Arguments]  ${reg_or_guest}
    Wait Until Element Is Visible   ${CUSTOMER_TYPE}
    Select From List By Value   ${CUSTOMER_TYPE}    ${reg_or_guest}

Customer Email
    ${customer_email_txt} =     Get Text    ${CUSTOMER_EMAIL}
    log     ${customer_email_txt}

Input From Date
    [Arguments]  ${input_date}
    Wait Until Element Is Visible   ${FROM_DATE}
    Input Text  ${FROM_DATE}    ${input_date}
    Click Element   ${LBL_CHECKOUT}

Input To Date
    [Arguments]  ${input_date}
    Wait Until Element Is Visible   ${TO_DATE}
    Input Text  ${TO_DATE}    ${input_date}
    Click Element   ${LBL_CHECKOUT}

Select Hotel Name
    [Arguments]  ${hotel_name}
    Wait Until Element Is Visible   ${SELECT_HOTEL}
    sleep   1
    Select From List By Label   ${SELECT_HOTEL}     ${hotel_name}

Select Room Type
    [Arguments]  ${type_of_room}
    Wait Until Element Is Visible   ${SELECT_ROOM}
    sleep   1
    Select From List By Label   ${SELECT_ROOM}     ${type_of_room}

Select Number of Rooms
    [Arguments]  ${room_qty}
    Wait Until Element Is Visible   ${ROOM_COUNT}
    sleep   2
    Select From List By Label   ${ROOM_COUNT}     ${room_qty}

Total Room Price
    ${room_price_total} =    Execute Javascript     return document.getElementById(${TOTAL_ROOM_PRICE}).value
    log     ${room_price_total}

Price For Rooms
    ${per_night} =    Execute Javascript     return document.getElementById(${PRICE_PER_NIGHT}).value
    log     ${per_night}

Room Price Type
    ${type_of_price} =    Execute Javascript     return document.getElementById(${PRICE_TYPE}).value
    log     ${type_of_price}

Price With VAT
    ${with_vat} =    Execute Javascript     return document.getElementById(${VAT_TAX}).value
    log     ${with_vat}

Price With B2C Markup
    ${with_b2c} =    Execute Javascript     return document.getElementById(${B2C_MARKUP_PCT}).value
    log     ${with_b2c}

Select Adults
    [Arguments]  ${adults_cnt}
    Wait Until Element Is Visible   ${TOTAL_ADULTS}
    sleep   2
    Select From List By Label   ${TOTAL_ADULTS}     ${adults_cnt}

Select Children
    [Arguments]  ${kids_cnt}
    Wait Until Element Is Visible   ${TOTAL_CHILDREN}
    sleep   2
    Select From List By Label   ${TOTAL_CHILDREN}     ${kids_cnt}

Price To Be Paid
    ${payment} =    Execute Javascript     return document.getElementById(${DEPOSIT_AMT}).value
    log     ${payment}

Select Payment Mode
    [Arguments]  ${pay_mode}
    Wait Until Element Is Visible   ${PAYMENT_METHOD}
    sleep   2
    Select From List By Label   ${PAYMENT_METHOD}     ${pay_mode}

Click Book Now Button
    Click Element       ${BTN_BOOK_NOW}
    Wait Until Element Is Visible       ${BOOKINGS_VIEW_PAGE}

Is Dashboard_Page
    Element Text Should Be      ${BOOKINGS_VIEW_PAGE}       BOOKINGS VIEW


