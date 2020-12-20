def write_file(file_name, content):
    f = open(file_name, "w")
    f.write(content)
    f.close()


def read_file(file_name):
    f = open(file_name, "r")
    s = f.read()
    f.close()
    return s
