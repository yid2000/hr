'''
def greeting(name):
    print("hello,"+name)

import mymodule
mymodule.greeting("sam")

import functions
a = functions.BMI_CAL("sam",168,75)

person1 = {
    "name" : "sam",
    "age" : 38,
    "country" : "norway"
}

import mymodule as mod1
a = mod1 . person1
print(a)

import platform
x = platform. system()
print(x)

import platform
x = dir(platform)
print(x)

import mymod1
a = mymod1.person2
print(a)

import helloworld
x = helloworld.car_info
print(x)

from functions import BMI_CAL
print(BMI_CAL("sam",1.2,32))

from functions import Miles_KM
print(Miles_KM(634))
'''

#datetime

import datetime
x = datetime.datetime.now()
print(x.year)
print(x.strftime("%A"))

import datetime
x = datetime.datetime(2020,7,23)
print(x)

import datetime
x = datetime.datetime.now()
print(x)
print(x.strftime("%A"))  # day full version
print(x.strftime("%a"))  # day short version
print(x.strftime("%B"))  # month full version
print(x.strftime("%b"))  # month short version
print(x.strftime("%Y"))  # year full version
print(x.strftime("%y"))  # year short version
print(x.strftime("%w"))  # number of day in week
print(x.strftime("%d"))  # number of day in month
print(x.strftime("%H"))  # hour in 24 hours
print(x.strftime("%I"))  # hour in 12
print(x.strftime("%p"))  # Am\pm
print(x.strftime("%m"))  # minute 0- 59
print(x.strftime("%s"))  # seconds 0-59
print(x.strftime("%f"))  # microsecond
#print(x.strftime("%z"))  # utc off set
#print(x.strftime("%Z"))  # time zone
print(x.strftime("%j"))  # number of day in year(365)
print(x.strftime("%U"))  # week number in year week starts on sunday
print(x.strftime("%W"))  # week number in year week stars on monday
print(x.strftime("%c"))  # local version of date and time
print(x.strftime("%x"))  # local version of date
print(x.strftime("%X"))  # local version of time

#JSON

import json
print(json.dumps({"name":"jhon", "age": 30}))
print(json.dumps(["banana","apple"]))
print(json.dumps(("apple","banana")))
print(json.dumps("hello"))
print(json.dumps(42))
print(json.dumps(31.45))
print(json.dumps(True))
print(json.dumps(False))
print(json.dumps(None))

