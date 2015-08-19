# :sparkles: TESTNOW RUBY EXAMPLE :sparkles:
Contains cucumber features for very famous magento web application.

## Overview :eyes:

Behavior Driven scenarios written in Cucumber for Magento web application.

Selenium-WebDriver is used as a backend tool for driving the browsers. This automation suite is compatible with following browsers
* Google Chrome
* Mozilla Firefox
* Internet Explorer
* Opera

This suite runs scenarios related to following:

1. Login and Signup related features
2. Buying of a product with different checkout methods
3. Newsletter subscriptions

##Purpose :eyes:

Major purpose of this example automation is to understand how one can make maximum usage of [TestNow](https://opexsoftware/testnow) cross browser testing with minimum effort by following some best practices mentioned here. 
Few Best Practices are as follows:

1. How to initialize different browsers
2. How to write appropriate setup and teardown's
3. How to take failed scenario screenshots
4. How to create json and html reports which helps TestNow to create consolidated reports for you.
5. How to organize code in case of Ruby Cucumber setup
6. and few more which you can relate to ... :)

## Application Under Test (AUT) :eyes:

__Magento__ is an ecommerce platform built on open source technology which provides online merchants with a flexible shopping cart system, as well as control over the look, content and functionality of their online store. Magento offers powerful marketing, search engine optimization, and catalog-management tools.

##How To Use This For Your Application :eyes:

Before you fork or borrow ideas from this example project, it might be useful to know some do's and dont's which will enable you to implement this awesome framework for your project hassle free.

__A walk through the folder structure__

1. Scenario folder is the place where all the test case descriptions are kept in Given-When-Then(GWT) format.
2. These scenarios link to step_definitions folder where 1-1 mapping is present for each GWT in scenario folder
3. Relation between Scenario and Step_Definitions folder is maintained in cucumber.yml file along with the reporting formats
4. Reports folder is an empty folder where the reports are created after execution
5. Pages folder contain the page-objects, all the elements and element interacting methods are present here
6. Support folder has the framework and is the most important and __Handle with care__ folder

__Do's__

1. Change the scenarios folder as per the test cases in your project
2. Make appropriate step_definitions for the new scenarios added by you

__Be careful (support folder)__

1. env contains all the requirement required for webdriver to run, adding more requirement is fine but removing an existing requirement might break things
2. driver_config contains the initializations of all browsers, changing this might not launch your browser correctly
3. hooks contain the setup and teardown for tests, these decide and call appropriate browser launch and kill and also take screenshots, again modifying this might break browser launch or screenshot functionality.
4. utilities contain the most utility mehtods widely used in the project, you can add/remove mehtods as per your project

__Dont's__

1. Do not delete cucumber.yml file as it acts as the main config file for cucumber containing mapping, profile and output reports formats. Without this cucumber will not execute
2. Do not delete Gemfile or else all gem installations will have to be done manually and bundle install command will not work.


## Requirements :eyes:

1. __Code__
  * TESTNOW RUBY EXAMPLE code 
2. __Programming Language__
  * Ruby
3. __Gems__
  * Bundler
  * Other gems will be automatically installed using bundler (process mentioned in Setup below)
4. __Browsers__
  * Google Chrome
  * Mozilla Firefox
  * Internet Explorer
  * Opera

## Setup :eyes:

1. __git clone https://github.com/opexsw/testnowrubyexample.git__
2. __bundle install (this will install all dependencies for running TESTNOW RUBY EXAMPLE)__

####NOTE: To avoid all the requirement and setup related extra work, use [TESTNOW](https://opexsoftware.com/testnow) :star2:

## Execution :eyes:

__Commmands__ 

1. __cucumber features/scenarios__ : This will execute all scenarios from all features
2. __cucumber features/scenarios/login.feature__ : This will only execute the scenarios in login feature file
3. __cucumber features/scenarios/login.feature:10__ : This will run only 1 scenario which has line number 10 in it from login.feature file

## Reporting :eyes:
Magento automation reports are created in following 2 types of format

1. __HTML__ : magento_report.html
2. __JSON__ : magento_report.json

Reports are created inside the Reports directory with above mentioned filenames

##Author :eyes:

* Name: __Kaushal Rupani__ :sunglasses:
* Organization: __Opex Software__ :star:
* Email: __kaushal.rupani@opexsoftware.com__

##Licence :eyes:
For Licence information, see [here](https://github.com/opexsw/testnowrubyexample/blob/master/LICENSE.txt)
