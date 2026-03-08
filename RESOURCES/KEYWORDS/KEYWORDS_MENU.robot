*** Settings ***
Resource       ${EXECDIR}${/}RESOURCES${/}COMMON.robot

*** Keywords ***
Navigate To Product Features Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_WHY_MATOMO']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_PRODUCT_FEATURES']}
    Wait Until Location Is Not       ${SUT_BASE_URL}
    
Navigate To Pricing Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_PRICING']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_PRICING']}
    Wait Until Location Is Not       ${SUT_BASE_URL}

Navigate To Help Centre Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_RESOURCES']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_HELP_CENTRE']}
    Wait Until Location Is Not       ${SUT_BASE_URL}