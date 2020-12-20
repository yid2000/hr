def Readfiles(filename):
    f = open(filename, "r")
    print(f.read())
    f.close()

Readfiles("schools.txt")
Readfiles("Grades.txt")
