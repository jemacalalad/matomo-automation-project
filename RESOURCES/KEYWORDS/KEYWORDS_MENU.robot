*** Settings ***
Resource       ${EXECDIR}${/}RESOURCES${/}COMMON.robot

*** Keywords ***
Navigate To Product Features Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_WHY_MATOMO']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_PRODUCT_FEATURES']}
    Wait Until Location Is           ${SUT_BASE_URL}${SUT_PATH_PRODUCT_FEATURES}
    
Navigate To Pricing Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_PRICING']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_PRICING']}
    Wait Until Location Is           ${SUT_BASE_URL}${SUT_PATH_PRICING}

Navigate To RESOURCES Page
    [Documentation]                  Navigates to the Product Features Page
    Select From Menu Bar Dropdown    ${COMPONENT_MENU_BAR['BUTTON_MENU_RESOURCES']}
    ...                              ${COMPONENT_MENU_BAR['BUTTON_SUB_MENU_HELP_CENTRE']}
    Wait Until Location Is           ${SUT_BASE_URL}${SUT_PATH_HELP_CENTRE}