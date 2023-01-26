import unittest
from selenium import webdriver
from time import sleep


class W3SchoolsTests(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get("https://www.w3schools.com/python/")

    def tearDown(self):
        self.driver.quit()

    def test_title(self):
        title = self.driver.title
        print(title)
        self.assertTrue(title, "Python Tutorial")


if __name__ == "__main__":
    unittest.main(verbosity=2)


