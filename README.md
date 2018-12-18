# http://automationpractice.com tests


## Pre-requisites

This project is setup to run against version 2.4.2 of Ruby.

## Installation

First clone the repository and then go into the local repo

```bash
git clone https://github.com/timstone/AutomationFrameworkChallenge.git && cd AutomationFrameworkChallenge
```

Next download and install the dependencies

```bash
bundle install
```

## Execution
To run the default setup in ./config/local_config.rb run:
```bash
bundle exec respec --require ./config/local_config.rb
```
or to specify either chrome or firefox at the command line
```bash
bundle exec rake local:firefox
```
```bash
bundle exec rake local:chrome
```


##TODO/Improvements
- Adding headless chrome configuration
- Browserstack integration
- consolidating page object classes
- Adding linting gem [https://github.com/rubocop-hq/rubocop]
- Refactoring wait_for's
- Looking at javascript execute alternative
- adding Capybara gem [https://github.com/teamcapybara/capybara]
- adding Siteprism page object gem [https://github.com/natritmeyer/site_prism]
- adding parallel testing
- adding Cucumber test framework [https://github.com/cucumber/cucumber-ruby]


