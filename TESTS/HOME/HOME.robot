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

