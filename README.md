# Matomo Automation Project
This is a repository containing the automated tests for Matomo as part of the technical assessment requirements. It utilizes a Page Object Model (POM) that uses Robot Framework automation for keywords and tests, and Python for data and locator management. This validates the core website functionalities of Matomo's homepage and the web training page.

## Prerequisites

1. Python 3.11 is installed
2. A Chrome browser is installed

## Setup

1. Clone or download this repository
2. Create a Virtual Environment:
    - MacOS: `python3.11 -m venv venv`
    - Windows: `python -m venv venv`
3. Activate the Virtual Environment:
    - MacOS: `source venv/bin/activate`
    - Windows: `venv\Scripts\activate`
4. Install dependencies: `pip3 install -r requirements.txt`
    - Verify installation: `pip3 show robotframework robotframework-seleniumlibrary robotframework-requests requests selenium`

## Automation Framework Structure
This project follows the Page Object Model (POM) structure
```
MATOMO-AUTOMATION-PROJECT
├── CONFIG/                             # Contains Spiels, Configuration, and URL Data
│   ├── SPIELS/                         # Data Assertion Python Files
│   │   ├── spiels_help_centre.py
│   │   ├── spiels_home.py
│   │   ├── spiels_pricing.py
│   │   ├── spiels_product_features.py
│   │   └── spiels_web_training.py
│   ├── SELENIUM_CONFIG.robot           # Selenium-specific Configuration
│   └── URLS.robot                      # URL Variables for the SUT
├── RESOURCES/                          # Resource Files of the Project
│   ├── KEYWORDS/                       # Reusable Keywords for the Components and Pages
│   │   └── KEYWORDS_MENU.robot
│   ├── RESOURCE_MAPPING/               # Locators for the Components and Pages
│   │   ├── COMPONENTS/                 # Locators for Shared UI Components across Pages
│   │   │   └── component_menu_bar.py
│   │   └── PAGES/                      # Locators Specific to Each Page
│   │       ├── page_help_centre.py
│   │       ├── page_home.py
│   │       ├── page_pricing.py
│   │       ├── page_product_features.py
│   │       └── page_web_training.py
│   └── COMMON.robot                    # Central Location for All Imports and Generic/Custom Keywords
├── TESTS/                              # Test Suites Folder
│   ├── HOME/                           # Tests for Homepage
│   │   └── HOME.robot
│   └── WEB_TRAINING/                   # Tests for the Web Training Page
│       └── WEB_TRAINING.robot
├── RESULTS/                            # Automatically-Generated Test Execution Results
│   ├── log.html
│   ├── output.xml
│   └── report.html                     # HTML-based Test Report
├── requirements.txt                    # Contains the Project Dependencies
└── README.md                           # Documentation of the Project
```

## How To Run The Automated Tests
1. Run the whole test suite: `robot -d RESULTS TESTS/`
2. Run tests in a specific folder: `robot -d RESULTS TESTS/HOME`
3. Run a specific test file: `robot -d RESULTS TESTS/HOME/HOME.robot`
4. Run tests in a specific tag: `robot -d RESULTS -i regression TESTS/`

## How To View the Test Execution Report
1. Make sure that the RESULTS folder contains the `report.html` file
2. Open the HTML file in any supported browser
3. Test Report contains the following sections
    - Summary: Report Summary
    - Statistics: Shows the number of test cases passed/failed based on the tag/suite
    - Details: An interactive interface showing more details of the test execution results

## Known Limitations
The automated tests will have failures due to certain URLs having 403 and 999 HTTP errors - which are the additional security layers of these applications for automated web crawling methods/requests.
- https://www.capterra.com/p/182627/Matomo-Analytics/
- https://www.softwareadvice.com/bi/matomo-profile/reviews/
- https://www.getapp.com.au/software/2053481/matomo
- https://www.linkedin.com/company/matomo