*** Settings ***
Documentation    As a user, I want to be able to access the Matomo Web Training page so I can see the training videos of the platform.

Resource         ${EXECDIR}${/}RESOURCES${/}COMMON.robot

Test Setup       Perform Generic Test Setup
Test Teardown    Close Browser

Test Tags        regression

*** Test Cases ***
Access Matomo Video Training Page
    [Documentation]                      User should be able to access the Matomo Web Video Training Landing Page
    [Tags]                               happy_path
    Navigate To Help Centre Page
    Location Should Be                   ${SUT_BASE_URL}${SUT_PATH_HELP_CENTRE}
    Click Element                        ${PAGE_HELP_CENTRE['LINK_MATOMO_VIDEO_TRAINING']}
    Location Should Be                   ${SUT_BASE_URL}${SUT_PATH_WEB_TRAINING}
    ${heading_text}                      Wait For Element Then Get Text                 ${PAGE_WEB_TRAINING['HEADING_WEB_TRAINING']}
    Should Be Equal                      ${heading_text}                                ${SPIELS_WEB_TRAINING['HEADING_WEB_TRAINING']}
    Element Should Be Visible            ${PAGE_WEB_TRAINING['LINK_MATOMO_VIDEO_TRAINING_INTRO']}