from SeleniumAutomation.WalmartItemPage.page_model.base_page import BasePage

class ItemPage(BasePage):

    @property
    def url(self):
        return super(ItemPage, self).url + "/ip/22660154"

    #Prod url - https://www.walmart.com/ip/4-Pack-Great-Value-Taco-Seasoning-Mix-Original-1-oz/440266612?selected=true