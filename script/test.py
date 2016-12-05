from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys
import time
import glob

path="C:/Users/tech33/Documents/Tencent Files/510919642/FileRecv/食品筛选总共"


browser = webdriver.Firefox() # Get local session of firefox
browser.get("http://58.240.82.242:8081/searchDemo/") # Load page
assert "My JSP" in browser.title
elem = browser.find_element_by_link("快速树查询") # Find the query box

elem = browser.find_element_by_id("image") # Find the query box
os.chdir(path)
for i in glob.glob('*.jpg')
    elem.send_keys("seleniumhq" + Keys.RETURN)
    time.sleep(0.2) # Let the page load, will be added to the API
    try:
        browser.find_element_by_xpath("//a[contains(@href,'http://seleniumhq.org')]")
    except NoSuchElementException:
        assert 0, "can't find seleniumhq"
browser.close()
