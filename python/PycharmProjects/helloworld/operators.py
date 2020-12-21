
#Arthmetic Operators

num1 = 10
num2 = 20
print('num1+num2= ', num1+num2)
print('num2-num1= ', num2-num1)
print('num1*num2= ', num1*num2)
print('num2/num1= ', num2/num1)
print('3^3= ', 3**3)
print('20%7= ', 20%7)
print('22//7= ', 22//7)


#Assinment Operators

num3 = num1+num2
print('num3= ', num1+num2)
num3+= num2
print(num3)
num3-= num2
print(num3)
num3*= num2
print(num3)
num3/= num2
print('num3= ', num3)
num3%= num1
print(num3)
num2//= 3
print(num2)
num1**=num2
print(num1)

# Comparrison Operartors

print("Is num3 > num2 ?", num3 > num2)
print("Is num3 < num2 ?", num3 < num2)
print("Is num3 == num2 ?", num3 == num2)
print("Is num3 != num2 ?", num3 != num2)

# Logical Operators

x= 2
y= 3
print("x and y ", x and y)
print("x or y ", x or y)
print("not of y",not y)

# Bitwise Operators

num4= 10
num5= 2
print('Bitwise and ', num4|num5)
print('Bitwise or ', num4&num5)
print('Bitwise Xor ', num4^num5)
print('num 4 rightshift by 2 ',num4 >> 2)
print("num 5 leftshift by 2 ", num5 << 2)


# Identity Operators

Z= 5
print("Z is 5,", Z is 5)
print('Z is not 5', Z is not 5)

# Membership Operators

x={1,2,3,4}
print('2 in x', 2 in x)
print("6 not in X ", 6 not in x)


# Number Data Type

print("4+2 =", 4 + 2)
print("2**3 =", 2 ** 3)
print('(2+2j)*2 =', (2 + 2j) * 2)

# String Data Type

str1 = 'Welcome '
str2 = 'Home'
str3 = str1 + str2
print(str3)
print(str1 + str2)
print(str1 * 3)
print(str3[4])
print(str3[3:9])
print(str3[-7:-1])
print(str1[2:-3])
string4= 'lakshmi'
print(string4.find("h", 0, 11))
print(str1.replace('Wel','Out'))
print(str3.split(','','))
print(str3.count("e"))
print(str3.upper())
#str1.max(str1)
#print(str3.min())

print(string4.isalpha())
print(len(str1))