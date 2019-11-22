from behave import *
from SeleniumAutomation.WalmartItemPage.page_model.base_page import BasePage

use_step_matcher('re')

@then('There is item title shown on the page')
def step_impl(context):
    page = BasePage(context.driver)
    assert page.title.is_displayed()