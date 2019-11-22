from selenium.webdriver.common.by import By

class ItemPageLocators:
    CART = By.XPATH, '/html/body/div[1]/div/div[1]/div/div[1]/div/div[2]/div/div/div[3]/div[4]/div[2]/div[1]/div/div/div/div[11]/div/div/div/button/span/span'
    CHECKOUT = By.XPATH, '/html/body/div[1]/div/div[1]/div/div[1]/div/div[1]/header/div/div[3]/div/div/div[3]/div/a/div/span[2]'