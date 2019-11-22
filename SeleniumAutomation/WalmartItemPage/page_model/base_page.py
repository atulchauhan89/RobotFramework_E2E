from SeleniumAutomation.WalmartItemPage.locators.base_page import BasePageLocators

class BasePage:
    def __init__(self, driver):
        self.driver = driver

    @property
    def url(self):
        return 'https://www.walmart.com'

    @property
    def title(self):
        return self.driver.find_element(*BasePageLocators.TITLE)