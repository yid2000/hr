'''
class Myclass:
    x = 5
p1 = Myclass()
print(p1.x)

class Person:
    def __init__(self, name, age):
     self.name = name
     self.age = age

    def myfunction(self):
        print("My name is ", self.name + " and I am ", self.age,".")

p1 = Person ("Jhon",38)
p1.myfunction()

p2 = Person ("sam",42)
p2.myfunction()

p1.age = 47

p1.myfunction()
del p1
p2.myfunction()

class Robot:
    def __init__(self, n, c, w):
        self.name = n
        self.color = c
        self.weight = w

    def introduce_self(self):
        print("My name is ",self.name, " and I like ", self.color)

r1= Robot("Tom","red",38)
r2= Robot("Jerry","blue",42)

class Person:
    def __init__(self, n, p, i):
        self.name = n
        self.personality = p
        self.issitting = i
    def sit_down(self):
        self.issitting = True

    def Stand_up(self):
        self.issitting = False

p1 = Person("alice", "aggresive", True)
p2 = Person("becky", "talkitive", False)

p1.Robot_owned = r2
p2.Robot_owned = r1

p1.Robot_owned.introduce_self()
p2.Robot_owned.introduce_self()

r1.introduce_self()
r2.introduce_self()
'''
# print("Hello, I am " , p1.name + " and I am ", p1.age )


# INHERITANCE :
'''
class Person:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname

    def Printname(self):
        print(self.firstname, self.lastname)
x = Person("Jhon","Doe")
x.Printname()

class Student(Person):
    pass
x = Student("Mike","Olesn")
x.Printname()

class Student(Person):
    def __init__(self, fname, lname, year):
        super().__init__(fname, lname)
        self.graduationyear  = year

    def Printname(self):
        print("Welcome",self.firstname, self.lastname,
              "to the class of ", self.graduationyear )

x = Student("Sam", "Michel",2019)
x.Printname()
'''
# ITERATORS
'''
my_tuple = ("apple", "banana", "cherry", "peach", "grapes")
my_it = iter(my_tuple)
for x in my_it:
    print(x)

my_str = "banana"
my_it = iter(my_str)
for x in my_str:
    print(x)


# create Iterator

class Mynumbers:
    def __iter__(self):
        self.a = 1
        return self

    def __next__(self):
        if self.a <= 20:
            b = self.a
            self.a += 1
            return b
        else:
            raise StopIteration

Myclass = Mynumbers()
myiter = iter(Myclass)

for x in myiter:
    print(x)
'''
#SCOPE :-

#LOCAL SCOPE
def myfunc():
    x = 300
    print(x)
myfunc()

#FUNCTION INSIDE FUNCTION:-

def myfunc():
    x = 600
    def myinnerfunc():
        print(x)
    myinnerfunc()
myfunc()

#GLOBAL SCOPE & NAMING VARIABLES :-

x = 700
def myfunc():
    x = 900
    print(x)
myfunc()
print(x)

#GLOBAL KEYWORD

def myfunc():
    global x
    x = 500
myfunc()
print(x)

#CHANGE THE VALUE OF GLOAL VARIABLE INSIDE A FUNCTION:

x = 200
def myfunc():
    global x
    x = 1200
myfunc()
print(x)
