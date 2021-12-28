from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
import os
from os.path import curdir

def getchrome():
    return_path = os.getcwd()
    driver_path = ChromeDriverManager(path=return_path).install()
    print(driver_path)
    return driver_path

def getff():
    return_path = os.getcwd()
    driver_path = GeckoDriverManager(path=return_path).install()
    print(driver_path)
    return driver_path


