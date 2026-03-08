*** Settings ***
Library        BuiltIn
Library        SeleniumLibrary
Library        RequestsLibrary
Library        Collections
Resource       ${EXECDIR}${/}CONFIG${/}SELENIUM_CONFIG.robot
Resource       ${EXECDIR}${/}CONFIG${/}URLS.robot
Resource       ${EXECDIR}${/}RESOURCES${/}KEYWORDS${/}KEYWORDS_MENU.robot
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_home.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_product_features.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_pricing.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_help_centre.py
Variables      ${EXECDIR}${/}CONFIG${/}SPIELS${/}spiels_web_training.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}COMPONENTS${/}component_menu_bar.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_home.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_product_features.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_pricing.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_help_centre.py
Variables      ${EXECDIR}${/}RESOURCES${/}RESOURCE_MAPPING${/}PAGES${/}page_web_training.py

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
    [Arguments]                         ${dropdown_selector}        ${option_selector}
    Mouse Over                          ${dropdown_selector}
    Wait For Element Then Click         ${option_selector}

Get All Specified Elements On Page And Return The Links
    [Documentation]                     Retrieves all images in the page and returns all the associated links
    [Arguments]                         ${locator_tag}    ${element_type}
    @{list_web_elements}                Get WebElements                ${locator_tag}
    ${link}                             Set Variable                   ${EMPTY}
    FOR    ${element}    IN    @{list_web_elements}
        IF    '${element_type}' == 'image'
            ${link}    Get Element Attribute        ${element}        src
        ELSE
            ${link}    Get Element Attribute        ${element}        href
        END
        IF    '${link}' == '${None}' or '${link}' == '' or 'data:' in '${link}'     CONTINUE
        Run Keyword And Continue On Failure    Verify Link Status    ${link}        ${element_type}
    END

Verify Link Status
    [Documentation]        Checks the status of the links and log InvalidSchema errors for non-HTTP values
    [Arguments]            ${url}    ${element_type}
    TRY
        ${response}=           GET        ${url}        expected_status=200    timeout=15
    EXCEPT    AS    ${error_message}
        Log    Broken ${element_type} at ${url} with error ${error_message}    level=ERROR
        Fail   ${element_type} at ${url} encountered an error: ${error_message}
    END