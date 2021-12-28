*** Settings ***
Library     SeleniumLibrary
Library     ./Resources/driver_initiator.py


*** Variables ***
${SIDE_BAR_MENU} =     xpath: //*[contains(@class,'sidebar-menu')]//*[contains(@class,'list-items')]
${MAIN_MENU_ITEMS} =    class: main-menu-content
${AUTHOR_META} =    class: author__meta



*** Keywords ***
Get SideBar Items Text
    [Arguments]  ${element_text}
    Element Text Should Be  ${SIDE_BAR_MENU}    ${element_text}

Get Main Menu Text
    [Arguments]  ${element_text}
    Element Text Should Be  ${MAIN_MENU_ITEMS}    ${element_text}

Get Welcome Text
    [Arguments]  ${element_text}
    Element Text Should Be  ${AUTHOR_META}    ${element_text}
