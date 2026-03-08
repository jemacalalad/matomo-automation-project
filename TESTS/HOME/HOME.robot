*** Settings ***
Documentation    As a user, I want to be able to access the Matomo homepage so I can see the overview of the platform.

Resource         ${EXECDIR}${/}RESOURCES${/}COMMON.robot

Test Setup       Perform Generic Test Setup
Test Teardown    Close Browser

Test Tags        regression

*** Test Cases ***
Access Homepage
    [Documentation]                User should be able to access the Matomo Homepage
    [Tags]                         happy_path    smoke
    ${heading_text}                Wait For Element Then Get Text     ${PAGE_HOME['HEADING_MATOMO']}
    Should Be Equal                ${heading_text}                    ${SPIELS_HOME['HEADING_MATOMO_HOME']}
    ${subheading_text}             Get Text                           ${PAGE_HOME['SUBHEADING_MATOMO']}
    Should Be Equal                ${subheading_text}                 ${SPIELS_HOME['SUBHEADING_MATOMO_HOME']}
    Element Should Be Visible      ${PAGE_HOME['BUTTON_START_FREE_TRIAL']}
    Element Should Be Visible      ${PAGE_HOME['BUTTON_MATOMO_ON_PREMISE']}

Access Product Features Page
    [Documentation]                      User should be able to access the Product Features Page
    [Tags]                               happy_path    smoke
    Navigate To Product Features Page
    Location Should Be                   ${SUT_BASE_URL}${SUT_PATH_PRODUCT_FEATURES}
    ${heading_text}                      Wait For Element Then Get Text                 ${PAGE_PRODUCT_FEATURES['HEADING_PRODUCT_FEATURES']}
    Should Be Equal                      ${heading_text}                                ${SPIELS_PRODUCT_FEATURES['HEADING_PRODUCT_FEATURES']}
    ${subheading_text}                   Get Text                                       ${PAGE_PRODUCT_FEATURES['SUBHEADING_PRODUCT_FEATURES']}
    Should Be Equal                      ${subheading_text}                             ${SPIELS_PRODUCT_FEATURES['SUBHEADING_PRODUCT_FEATURES']}

Access Pricing Page
    [Documentation]                      User should be able to access the Pricing Page
    [Tags]                               happy_path    smoke
    Navigate To Pricing Page
    Location Should Be                   ${SUT_BASE_URL}${SUT_PATH_PRICING}
    ${heading_text}                      Wait For Element Then Get Text          ${PAGE_PRICING['HEADING_PRICING']}
    Should Be Equal                      ${heading_text}                         ${SPIELS_PRICING['HEADING_PRICING']}
    ${subheading_text}                   Get Text                                ${PAGE_PRICING['SUBHEADING_PRICING']}
    Should Be Equal                      ${subheading_text}                      ${SPIELS_PRICING['SUBHEADING_PRICING']}

Access Help Centre Page
    [Documentation]                      User should be able to access the Help Centre Page
    [Tags]                               happy_path    smoke
    Navigate To Help Centre Page
    Location Should Be                   ${SUT_BASE_URL}${SUT_PATH_HELP_CENTRE}
    ${heading_text}                      Wait For Element Then Get Text                 ${PAGE_HELP_CENTRE['HEADING_HELP_CENTRE']}
    Should Be Equal                      ${heading_text}                                ${SPIELS_HELP_CENTRE['HEADING_HELP_CENTRE']}
    Element Should Be Visible            ${PAGE_HELP_CENTRE['INPUT_SEARCH']}
    Element Should Be Visible            ${PAGE_HELP_CENTRE['BUTTON_SEARCH']}