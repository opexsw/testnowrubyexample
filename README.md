# TESTNOW RUBY EXAMPLE
Contains cucumber features for very famous magento web application.

## Overview:

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

##Purpose:

Major purpose of this example automation is to understand how one can make maximum usage of [TestNow](https://opexsoftware/testnow) cross browser testing with minimum effort by following some best practices mentioned here. 
Few Best Practices are as follows:

1. How to initialize different browsers
2. How to write appropriate setup and teardown's
3. How to take failed scenario screenshots
4. How to create json and html reports which helps TestNow to create consolidated reports for you.
5. How to organize code in case of Ruby Cucumber setup
6. and few more which you can relate to ... :)

## Application Under Test (AUT)

__Magento__ is an ecommerce platform built on open source technology which provides online merchants with a flexible shopping cart system, as well as control over the look, content and functionality of their online store. Magento offers powerful marketing, search engine optimization, and catalog-management tools.

## Requirements:

1. __Code__
  * Magneto Automation suite
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

## Setup:

1. __git clone https://github.com/krupani/magento_automation.git__
2. __bundle install (this will install all dependencies for running magento automation suite)__

####NOTE: To avoid all the requirement and setup related extra work, use [TESTNOW](https://opexsoftware.com/testnow)

## Execution:

__Commmand__ : cucumber features

## Reporting:
Magento automation reports are created in following 2 types of format

1. __HTML__ : magento_report.html
2. __JSON__ : magento_report.json

Reports are created inside the Reports directory with above mentioned filenames

##Author:

* Name: __Kaushal Rupani__
* Organization: __Opex Software__
* Email: __kaushal.rupani@opexsoftware.com__

##Licence:
For Licence information, see [here](https://github.com/opexsw/testnowrubyexample/blob/master/LICENSE.txt)
