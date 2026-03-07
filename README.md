# matomo-automation-project
This is a repository containing the automated tests for Matomo as part of the requirements for the application

## Prerequisites

1. Python 3.x is installed
2. A Chrome browser is installed

## Setup

1. Install [Python](https://www.python.org/) via Homebrew: `brew install python`
    - Verify installation: `python3 --version`
2. Clone or download this repository
3. Create a Virtual Environment: `python3 -m venv venv`
4. Activate the Virtual Environment:
    - MacOS: `source venv/bin/activate`
    - Windows: `venv\Scripts\activate`
5. Install dependencies: `pip3 install -r requirements.txt`
    - Verify installation: `pip3 show robotframework robotframework-seleniumlibrary robotframework-requests requests selenium`
