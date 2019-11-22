from behave import *
from selenium import webdriver
from SeleniumAutomation.WalmartItemPage.page_model.item_page import ItemPage

use_step_matcher('re')

@given('I am on the walmart item page')
def step_impl(context):
    context.driver = webdriver.Chrome('/Users/sdodia/Downloads/chromedriver')
    page = ItemPage(context.driver)
    context.driver.get(page.url)