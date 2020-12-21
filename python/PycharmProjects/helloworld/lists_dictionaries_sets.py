
d = {}
d["george"] = 32
d['tom'] = 24
d['jenny'] = 16
print(d)
d['jenny'] = 20
print(d)
print(d['tom'])

for key, value in d.items():
    print("key:" )
    print(key)
    print('value:')
    print(value)
    print('')

for x in d:
   print(d)
   #print(d[x])

for x in d.values():
    print(x)

for x, y in d.items():
    print(x,y)

print(len(d))

print(d.get('tom'))
print(d['tom'])
my_dict = {'brand': 'ford',
           'model': 'mustang',
           'year': 2007}
x = my_dict.get('model')
print(my_dict)
my_dict['color'] = 'red'
print(my_dict)
my_dict['type'] = 'suv'
print(my_dict)
my_dict.pop('type')
print(my_dict)
my_dict.popitem()
print(my_dict)
for x, y in my_dict.items():
    print(my_dict)
for x in my_dict.values():
    print(my_dict)
for x in my_dict:  # for keys
    print(x)
for x in my_dict:
    print(my_dict[x])  # for values
x = my_dict
if 'model' in x:
    print('yes, model is in this dictionary')

car_dict = my_dict.copy()
print(car_dict)

car_deta = dict(my_dict)
print(car_deta)

car_deta.clear()
print(car_deta)

car_deta['model']= 'mustang'
print(car_deta)

#del car_deta['model']
print(car_deta)

del car_deta

print(car_dict)
car_dict1 = dict(car_dict)
print(car_dict1)
car_dict2 = dict(car_dict1)
print(car_dict2)
car_dict2['brand']='honda'
car_dict2['model']='civic'
car_dict2['year']=2017
print(car_dict2)
car_dict3= dict(car_dict2)
print(car_dict3)
car_dict3['brand']='nissan'
car_dict3['model']='sentra'
car_dict3['year']=2015
print(car_dict3)
car_info={
          "car_dict1": car_dict,
          "car_dict2": car_dict2,
          "car_dict3": car_dict3
}
print(car_info)

my_family =dict(name='tommy',year=2010)
print(my_family)


#lists

# create list

my_list =["apple","banana","cherry"]
print(my_list)

my_list.append("orange")
print(my_list)

my_list.insert(5,"kiwi")
print(my_list)

print(my_list[1])    # accessing the item

print(my_list[-1])   # negitive indexing

print(my_list[2:5])  # specifng the range

print(my_list[-4:-2])# specifing the negitive range

my_list[2] = "peach" #changing the item in specifed place
print(my_list)

# loop through a list
for x in my_list:
     print(x)

# check the item exists
if "peach" in my_list:
    print("yes,'peach'is in the fruit list ")

print(len(my_list))  #lenth of the list

my_list.sort()
print(my_list)       #sorting the items in alphabetical order

my_list.reverse()
print(my_list)       # writing in reverse order

fruit = my_list.copy()     # copying the entire list
print(fruit)

fruits = list(fruit)
print(fruits)

my_list.remove("orange")  #removes specifed item
print(my_list)

my_list.pop()         # removes last specifed item
print(my_list)

del my_list[2]        # delete the in specified #no
print(my_list)

my_list.clear()       #clear the data from list
print(my_list)

del my_list
#print(my_list)

veg = ["okra","chilli","carrot","tomato","beans"]
print(veg)

print(fruit)

fru_veg = fruit + veg   #join two lists
print(fru_veg)

for x in veg:
    fruit.append(x)
print(fruit)

veg.extend(fruits)
print(veg)

print(len(veg))


# tuples
#create a tuple
from typing import Tuple

mytup = ("sam","james","mike","david","jo")
print(mytup)

print(mytup[1])   #access the item

print(mytup[-3])

print(mytup[2:5])  #index range

print(mytup[-5:-2])

# convert tuple to list:- to change values
myset = list(mytup)
myset[2] = "jaden"
mytup = tuple(myset)
print(mytup)

#loop through a tuple
for x in mytup:
    print(x)

if "jo" in mytup:
    print("yes, he is in the list")

print(len(mytup))

tup1 = ("mike","kevin","lee")
print(tup1)

print(type(tup1))

tup2 = tuple(tup1)
print(tup2)

print(tup1)

del tup2

tup3 = mytup + tup1
print(tup3)

#sets

myset ={"toy","puzzle","dolls","games"}
print(myset)

for x in myset:     #loop throgh a set
    print(x)

print("puzzle in myset")

myset.add("legos")    #additems
print(myset)

myset.update(["minecraft","friends","kitchenset"])
print(myset)

print(len(myset))   #lenth of the set

myset.remove("kitchenset")   # removing items
print(myset)

myset.discard("kitchenset")
print(myset)

myset.pop()
print(myset)

set1 = set(myset)
print(set1)

myset.clear()
print(myset)

#del myset
#print(myset)

set2 = {"bubbles","water guns","balls","skipping rope","legos","puzzle"}
print(set2)

set3 = set2.union(set1)
print(set3)

#set2.update(set1)
#print(set2)
set_def = set1.difference(set2)
print("set_def = ", set_def)

set_int = set1.intersection(set2)
print("set_int = ", set_int)

print("union = ", set1|set2)
print("difference = ", set1 - set2)

print("intersection = ", set2 & set1)

