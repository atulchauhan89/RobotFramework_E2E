from behave import *
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from SeleniumAutomation.WalmartItemPage.locators.item_page import ItemPageLocators
from selenium.webdriver.support import expected_conditions as EC

use_step_matcher('re')

@when('click on add to cart and checkout')
def step_impl(context):
    link = context.driver.find_element(*ItemPageLocators.CART)
    link.click()
    wait = WebDriverWait(context.driver, 5)
    #wait.until(EC._element_if_visible(By.XPATH, '//*[@id="postAddToCartSuccess"]/span/span[1]').is_displayed())
    #close_popup = context.driver.find_element(By.XPATH, '/html/body/div[2]/div/div[1]/div/div/div[2]/button/span/span')
    #close_popup.click()
    link = context.driver.find_element(*ItemPageLocators.CHECKOUT)
    link.click()

# @when('click on checkout')
# def step_impl(context):
#     link = context.driver.find_element(*ItemPageLocators.CHECKOUT)
#     link.click()
#     #context.driver.implicitly_wait(3000)