*** Settings ***
Library        BuiltIn
Library        SeleniumLibrary
Library        RequestsLibrary
Resource       ${EXECDIR}${/}CONFIG${/}SELENIUM_CONFIG.robot
Resource       ${EXECDIR}${/}CONFIG${/}URLS.robot
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_home.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_product_features.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_pricing.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_help_centre.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_menu_bar.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_home.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_product_features.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_pricing.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_help_centre.py

*** Keywords ***
Perform Generic Test Setup
    [Documentation]        Opens a browser and maximizes the window
    Open Browser           ${SUT_BASE_URL}    ${BROWSER}
    Maximize Browser Window

Wait For Element Then Click
    [Documentation]                     Waits for the Element to be Visible before Clicking
    [Arguments]                         ${element_selector}
    Wait Until Element Is Visible       ${element_selector}
    Click Element                       ${element_selector}

Wait For Element Then Get Text
    [Documentation]                     Waits for the Element to be Visible before getting the text
    [Arguments]                         ${element_selector}
    Wait Until Element Is Visible       ${element_selector}
    ${text}                             Get Text                    ${element_selector}
    RETURN                              ${text}

Select From Menu Bar Dropdown
    [Documentation]                     Selects an option from the given dropdown
    [Arguments]                         ${dropdown_selector}    ${option_selector}
    Mouse Over                          ${dropdown_selector}
    Wait For Element Then Click         ${option_selector}
