def WriteFile(fileName, content):
  f = open(fileName, "w")
  f.write(content)
  f.close()

WriteFile("Schools.txt", "Foresk Park")
WriteFile("Grades.txt", "K 1 2 3 4 5 6")
