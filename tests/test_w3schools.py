import unittest
from selenium import webdriver


class W3SchoolsTests(unittest.TestCase):
    def setUp(self):
        ff_options = webdriver.FirefoxOptions()
        ff_options.add_argument('--headless')
        # Display mode off: Docker containers have no display.
        self.driver = webdriver.Firefox(options=ff_options)
        self.driver.get("https://www.w3schools.com/python/")

    def tearDown(self):
        self.driver.quit()

    def test_title(self):
        title = self.driver.title
        print(title)
        self.assertTrue(title, "Python Tutorial")


if __name__ == "__main__":
    unittest.main(verbosity=2)
