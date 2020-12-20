def function1():
    print(" I am happy")
    print("because i got grade 'A'")


print("thats why I am happy")

function1()
function1()


# mapping

def function2(x):
    return 2 * x


a = function2(4)
print(a)

b = function2(7)
print(b)


def function(x, y):
    return x + y


c = function(3, 9)
print(c)


def function4(x):
    print(x)
    print("still in the function")
    return 3 * x


d = function4(7)
print(d)

f = function4(9)
print(f)


def function5(some_argument):
    print(some_argument)
    print("nice")


g = function5("sam said")
print(g)

Name1 = "sam",
height_m1 = 2,
weight_kg1 = 69

Name2 = "james",
height_m2 = 2.2
weight_kg2 = 82

Name3 = "anji",
height_m3 = 63,
weight_kg3 = 175


def BMI_CAL(name, height_m, weight_kg):
    BMI = 703 * weight_kg / (height_m ** 2)
    print("BMI =", BMI)
    # print(BMI)
    if BMI < 25:
        return name + " is not over weight"
    elif BMI > 25 and BMI < 30:
        return name + " is over weight"
    else:
        return name + " obese"
BMI_CAL("anji", 63, 175)

result1 = BMI_CAL("sam", 2, 69)
print(result1)

result2 = BMI_CAL("james", 1.8, 95)
print(result2)


def Miles_KM(miles):
    KM = 1.6 * miles
    print("KM = ", KM)


result3 = Miles_KM(98)
print(result3)

result4 = Miles_KM(487)
print(result4)

result5 = Miles_KM(6798)
print(result5)
