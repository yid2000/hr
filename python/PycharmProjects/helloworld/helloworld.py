'''

marks = 73
if (marks > 80):
    print('Grade A')
elif (marks > 60) and (marks <=80):
    print ('Grade B')
elif (marks > 40) and (marks <= 60):
    print ('Grade C')
else:
    print ('Grade D')

'''

#---------------
'''

num = int(input('Enter the value of n = '))
if (num % 2) == 0 :
    print ('even number')
else :
    print ('odd number')

#-----------------
'''

'''
count = 0
while True :
    print(count)
    count += 1
if ( count > 10):
    break


'''
#For loop

a = ['banana','apple','microsoft']
for element in a:
    print(element)

for i in range(len(a)):
    for j in range (i+1):
        print(a[i])

b =[20,40,60]
total = 0
for e in b:
    total += e  #total = total + e
    print(total)


#find the sum of total list
#for loop

c = list(range(1,5))
print(c)

total1 = 0
for i in range(1,5):
    total1 += i
print(total1)

#while loop

total1 = 0
j = 1
while j < 5:
    total1 += j
    j += 1
print(total1)

'''

#find the sum of 3 multiples

total2 = 0
for i in range (1,8):
    if i % 3 == 0:
     total2 += i
print(total2)

#find the multiples of 3 in range (1,100)

total3 =0
for i in range (1,100):
    if i % 3 == 0 or i % 5 == 0:
        total3 += i
print(total3)


#while loop examples

#find the total of given list total

given_list = list(range(-5,6))
print(given_list)
total4 = 0
i = 0
while given_list[i] < 0:
    total4 += i
    i += 1
print(total4)


#only of positive numbers

given_list = [5,4,3,2,1,0]
total4 = 0
i = 0
while i < len (given_list) and given_list[i] > 0:
    total4 += given_list[i]
    i += 1
print(total4)


#for
given_list2 =[5,4,3,2,1,0,-1,-2,-3,-4,-5]
total5 = 0
for e in given_list2:
    if e <=0:
        break
    total5 += e
print(total5)


#while
given_list = [5,4,3,2,1,0,-1,-2,-3,-4,-5]
total5 = 0
i = 0
while True:
    total5 += given_list[i]
    i += 1
    if given_list[i] <= 0:
        break
print(total5)

#find the sum for negitive numbers
#for
given_list2 =[7,6,5,4,3,2,3,1,0,-1,-2,-3,-4,-5,-6,-7]
total5 = 0
for e in given_list2:
    if e <= 0:
        total5 += e
print(total5)

#while

given_list2 = [7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5,-6,-7]
total5 = 0
i = len(given_list2) -1
while given_list2[i] < 0 :
    total5 += given_list2[i]
    i -= 1
print(total5)

'''
car_info ={
    "brand":"nissan",
    "model":"sentra",
    "year":2018
}
print(car_info)